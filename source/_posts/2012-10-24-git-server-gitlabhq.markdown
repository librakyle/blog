---
layout: post
title: "Git服务器搭建—Gitlab"
date: 2012-10-24 14:59
comments: true
categories:
    - Program
tags:
    - Git
    - Gitlab
---

这几天在Ubuntu系统下搭建好了Git服务器，采用开源的[Gitlab](https://github.com/gitlabhq/gitlabhq/)。
由于Gitlab更新频率挺快，参考官方文档还是相当靠谱的，这里只是简单记录几笔。

<!-- more -->

### Gitlab安装相关

安装过程中需要修改Gitlab的配置文件。
```
# web:host, eamil:from, git_host:admin_url host
sudo vim /etc/nginx/sites-enabled/gitlab
# listen, server_name
sudo vim /home/gitlab/gitlab/config/gitlab.yml
```

安装完成之后，需要运行如下命令来使得Gitolite认可当前域名，切记切记！！！
```
sudo -u gitlab -H git clone git@[server_name]:gitolite-admin.git /tmp/gitolite-admin
```

在Gitlab上新建项目可能需要较长时间，需要耐心等待。想要重启Gitlab服务，可以使用如下命令：
```
sudo /etc/init.d/nginx restart
sudo /etc/init.d/gitlab restart
```

### [未解决的问题](https://github.com/gitlabhq/gitlabhq/issues/1780)

* 如果文件名称或者路径名包含中文，在Gitlab页面上不能正常查看文件内容。
{% img center /images/png/gitlab-file.png 'Gitlab File Show Error' 'Gitlab File Show Error' %}

* 如果Git提交中的文件名称包含中文，那么该文件无法显示修改对比。
{% img center /images/png/gitlab-commit.png 'Gitlab Commit Show Error' 'Gitlab Commit Show Error' %}

