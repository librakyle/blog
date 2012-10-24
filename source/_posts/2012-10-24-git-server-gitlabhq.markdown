---
layout: post
title: "Git服务器搭建——Gitlabhq"
date: 2012-10-24 14:59
comments: true
categories:
    - Program
tags:
    - Git
    - Gitlabhq
---

### 文档说明

这几天在Ubuntu系统下搭建好了一个Git服务器，采用的是开源的[Gitlabhq](https://github.com/gitlabhq/gitlabhq/blob/master/doc/installation.md)。
在这里记录搭建的流程以及中间出现的问题。

### 搭建Gitlabhq

#### 更新软件包
```
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y wget curl gcc checkinstall libxml2-dev libxslt-dev libcurl4-openssl-dev libreadline6-dev libc6-dev libssl-dev libmysql++-dev make build-essential zlib1g-dev libicu-dev redis-server openssh-server git-core python-dev python-pip libyaml-dev postfix libpq-dev
```

<!-- more -->

#### 安装数据库
```
# 安装sqlite3数据库
sudo apt-get install -y sqlite3 libsqlite3-dev 
# 安装mysql数据库
sudo apt-get install -y mysql-server mysql-client libmysqlclient-dev
mysql -u root -p
mysql> CREATE DATABASE IF NOT EXISTS `gitlabhq_production` DEFAULT CHARACTER SET `utf8` COLLATE `utf8_unicode_ci`;
mysql> CREATE USER 'gitlab'@'localhost' IDENTIFIED BY '$password';
mysql> GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER ON `gitlabhq_production`.* TO 'gitlab'@'localhost';
```

#### 安装Ruby
```
wget http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.tar.gz
tar xfvz ruby-1.9.3-p194.tar.gz
cd ruby-1.9.3-p194
./configure
make
sudo make install
```
我是在VirtualBox中的虚拟机Ubuntu下操作的，不知道是什么原因上面的ruby软件包下载失败，因此只能在windows下下载后再拷贝到ubuntu下进行相关操作。

#### 安装Gitolite
```
sudo adduser --system --shell /bin/sh --gecos 'git version control' --group --disabled-password --home /home/git git
sudo adduser --disabled-login --gecos 'gitlab system' gitlab
sudo usermod -a -G git gitlab
sudo usermod -a -G gitlab git
sudo -H -u gitlab ssh-keygen -q -N '' -t rsa -f /home/gitlab/.ssh/id_rsa
sudo -H -u git git clone -b gl-v304 https://github.com/gitlabhq/gitolite.git /home/git/gitolite
cd /home/git
sudo -u git -H mkdir bin
sudo -u git sh -c 'echo -e "PATH=\$PATH:/home/git/bin\nexport PATH" >> /home/git/.profile'
sudo -u git sh -c 'gitolite/install -ln /home/git/bin'
sudo cp /home/gitlab/.ssh/id_rsa.pub /home/git/gitlab.pub
sudo chmod 0444 /home/git/gitlab.pub
sudo -u git -H sh -c "PATH=/home/git/bin:$PATH; gitolite setup -pk /home/git/gitlab.pub"
sudo -u git -H sed -i 's/0077/0007/g' /home/git/.gitolite.rc
sudo -u git -H sed -i "s/\(GIT_CONFIG_KEYS\s*=>*\s*\).\{2\}/\1'\.\*'/g" /home/git/.gitolite.rc
sudo chmod -R g+rwX /home/git/repositories/
sudo chown -R git:git /home/git/repositories/
# 上述安装完成后需要退出Ubuntu系统再重新登陆账户，测试Gitolite
sudo -u gitlab -H git clone git@localhost:gitolite-admin.git /tmp/gitolite-admin
sudo rm -rf /tmp/gitolite-admin
```

#### 安装Gitlab
```
sudo gem install charlock_holmes --version '0.6.8'
sudo pip install pygments
sudo gem install bundler
cd /home/gitlab

# 安装稳定版本使用如下命令
sudo -H -u gitlab git clone -b stable https://github.com/gitlabhq/gitlabhq.git gitlab
# 安装最新版本使用如下命令
sudo -H -u gitlab git clone -b master https://github.com/gitlabhq/gitlabhq.git gitlab

cd gitlab
sudo -u gitlab cp config/gitlab.yml.example config/gitlab.yml

# 配置sqlite3数据库
sudo -u gitlab cp config/database.yml.sqlite config/database.yml
sudo -u gitlab -H bundle install --without development test mysql postgres  --deployment
# 配置mysql数据库，注意需要修改config/database.yml中的用户名和密码
sudo -u gitlab cp config/database.yml.mysql config/database.yml
sudo -u gitlab -H bundle install --without development test sqlite postgres  --deployment

# 数据库初始化
sudo -u gitlab bundle exec rake gitlab:app:setup RAILS_ENV=production
# 如果上述出现错误提示`Run rake db:migrate to update your database then try again`，需要运行如下命令
sudo -u gitlab -H bundle exec rake db:migrate RAILS_ENV=production

sudo cp ./lib/hooks/post-receive /home/git/.gitolite/hooks/common/post-receive
sudo chown git:git /home/git/.gitolite/hooks/common/post-receive

# 检验Gitlabhq的安装结果
sudo -u gitlab bundle exec rake gitlab:app:status RAILS_ENV=production

# 配置参数
sudo -u gitlab cp config/resque.yml.example config/resque.yml
# 如果Gitolite不是安装在同一系统下，则需要运行下面命令将localhost修改为对应的域名（本次安装没有进行如下操作，因此没有测试下面的修改）
vim sudo config/resque.yml
# 修改Gitlab配置中主机域名
# web
#   - host
# email
#   - from
# git_host
#   - admin-uri
#   - host
vim sudo config/gitlab.yml

# 开启Gitlabhq服务，初始用户名为：admin@local.host，密码为5iveL!fe。
sudo -u gitlab bundle exec rails s -e production
sudo -u gitlab bundle exec rails s -e production -d

# 配置WEB服务
cd /home/gitlab/gitlab
sudo -u gitlab cp config/unicorn.rb.example config/unicorn.rb
sudo -u gitlab bundle exec unicorn_rails -c config/unicorn.rb -E production -D
sudo apt-get install nginx
sudo wget https://raw.github.com/gitlabhq/gitlab-recipes/master/nginx/gitlab -P /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/gitlab /etc/nginx/sites-enabled/gitlab
# 修改listen、server_name
sudo vim /etc/nginx/sites-enabled/gitlab
sudo /etc/init.d/nginx restart
sudo wget https://raw.github.com/gitlabhq/gitlab-recipes/master/init.d/gitlab -P /etc/init.d/
sudo chmod +x /etc/init.d/gitlab
sudo update-rc.d gitlab defaults 21
sudo /etc/init.d/gitlab restart
```
### 未解决的问题

* 当文件名称或者路径名词为中文时，Gitlabhq页面点击查看文件内容时会出现异常。
{% img center /images/png/gitlab-file.png 'Gitlab File Show Error' 'Gitlab File Show Error' %}

* 当某提交中文件包含中文命名的文件，那么该文件无法展示修改对比。
{% img center /images/png/gitlab-commit.png 'Gitlab Commit Show Error' 'Gitlab Commit Show Error' %}

