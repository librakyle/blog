---
layout: post
title: "Ubuntu 开发环境"
date: 2012-11-09 09:53
comments: true
categories: 
    - Program
tags: 
    - Ubuntu
    - Vim
    - Makefile
    - GDB
---

最近安装Ubuntu后，开始折腾Ubuntu下的开发环境:
编辑器选择的是vim，编译c++程序选择的是g++，并自己去写makefile文件，
调试程序选择gdb。

<!-- more -->

#### Vim

采用vundle來管理vim的各种插件，配置文件如下：
{% include_code .vimrc lang:ini %}

#### Makefile

感谢陈皓编写的[“跟我一起写Makefile”](http://blog.csdn.net/haoel/article/details/2886)系列，
使得我在学习Makefile的时候轻松不少。
另外，他还提供了一个[调试Makefile的小脚本](http://coolshell.cn/articles/3790.html)，
觉得挺好的，记录在这里也分享给大家：
{% include_code vars.mk lang:ini %}

参考<http://sourceforge.net/projects/gcmakefile/>提供的
一个C++通用的Makefile文件， 修改了一部分配置使得它更加适合自己使用，
主要包含如下几个方面：
* 编译过程中能够自动递归遍历程序根路径下的所有文件夹
* 支持同时编译多个应用程序
* 添加Opencv和boost链接选项
* 修改删除了一些自己用不上相关配置

修改完成后的Makefile文件如下:
{% include_code Makefile lang:ini %}

#### GDB

学习GDB的时候，参考了陈皓编写的[“用GDB调试程序”](http://blog.csdn.net/haoel/article/details/2879)系列，
受益匪浅。


