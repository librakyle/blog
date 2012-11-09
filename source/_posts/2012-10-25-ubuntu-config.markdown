---
layout: post
title: "Ubuntu配置"
date: 2012-10-25 13:01
comments: true
categories: 
    - Program
tags:
    - Ubuntu
    - VirtualBox

---

记录下VirtualBox下安装Ubuntu虚拟机的一些配置。

### 配置Ubuntu

#### 安装右键终端
```
sudo apt-get install nautilus-open-terminal
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

<!-- more -->

#### 软件源
```
sudo cp /etc/apt/sources.list /etc/apt/sources.list_backup
gedit /etc/apt/sources.list
sudo apt-get update
sudo apt-get upgrade
```

