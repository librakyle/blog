---
layout: post
title: "Ubuntu Install"
date: 2012-10-25 13:01
comments: true
published: false
categories: 
    - Program
tags:
    - Ubuntu
---

### 文档说明

记录下VirtualBox下安装Ubuntu虚拟机的一些配置。

### 配置Ubuntu

#### 配置Vim
```
vim /etc/vim/vimrc.local
```

#### 桌面中文问题
```
vim ～/.config/user-dirs.dirs
XDG_DESKTOP_DIR="$HOME/"
XDG_DOWNLOAD_DIR="$HOME/"
XDG_TEMPLATES_DIR="$HOME/"
XDG_PUBLICSHARE_DIR="$HOME/"
XDG_DOCUMENTS_DIR="$HOME/"
XDG_MUSIC_DIR="$HOME/"
XDG_PICTURES_DIR="$HOME/"
XDG_VIDEOS_DIR="$HOME/"
```

#### 文件共享
```
sudo adduser librakyle vboxsf
ln -s /media/sf_ubuntu/ ~/shared
```

<!-- more -->

#### 软件源
```
sudo cp /etc/apt/sources.list /etc/apt/sources.list_backup
gedit /etc/apt/sources.list
deb http://mirrors.sohu.com/ubuntu/ precise main restricted universe multiverse
deb http://mirrors.sohu.com/ubuntu/ precise-security main restricted universe multiverse
deb http://mirrors.sohu.com/ubuntu/ precise-updates main restricted universe multiverse
deb http://mirrors.sohu.com/ubuntu/ precise-proposed main restricted universe multiverse
deb http://mirrors.sohu.com/ubuntu/ precise-backports main restricted universe multiverse
deb-src http://mirrors.sohu.com/ubuntu/ precise main restricted universe multiverse
deb-src http://mirrors.sohu.com/ubuntu/ precise-security main restricted universe multiverse
deb-src http://mirrors.sohu.com/ubuntu/ precise-updates main restricted universe multiverse
deb-src http://mirrors.sohu.com/ubuntu/ precise-proposed main restricted universe multiverse
deb-src http://mirrors.sohu.com/ubuntu/ precise-backports main restricted universe multiverse
sudo apt-get update
sudo apt-get upgrade
```


