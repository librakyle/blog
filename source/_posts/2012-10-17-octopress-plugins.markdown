---
layout: post
title: "Octopress Plugins 使用样例"
date: 2012-10-17 10:20
comments: 
categories: 
    - Program
tags:
    - Octopress
---

参考[Octopress](http://octopress.org)的说明文档，记录下使用Octopress插件的部分样例，方便以后查找。

<!--more-->

### 高亮显示代码
{% codeblock %}
echo "Hello World."
{% endcodeblock %}
{% codeblock Test Codeblock lang:cpp http://blog.librakyle.com HomePage %}
#include <iostream>
using namespace std;
int main(int argc, char *argv[])
{
    cout << "Hello World." << endl;
    return 0;
}
{% endcodeblock %}
``` cpp Test Backtick http://blog.librakyle.com HomePage
#include <iostream>
using namespace std;
int main(int argc, char *argv[])
{
    cout << "Hello World." << endl;
    return 0;
}
```
{% include_code Test test.cpp %}
{% gist 3903590 %}
{% gist 3903596 test.cpp %}

### 显示图片
{% img center /images/Basset-Hound.png 300 300 'Basset-Hound' 'Basset-Hound' %}

### 显示视频
{% video http://www.brandwisdom.cn//style/bw.flv 480 320 http://www.brandwisdom.cn//style/images1/bwIndex.png %}
视频播放失败，等有时间再研究一下原因。

### 显示引用
{% blockquote LibraKyle http://blog.librakyle.com Welcome to LibraKyle Home %}
LibraKyle Home
4B 79 6C 65 20 6C 6F 76 65 73 20 46 65 6C 69 63 69 61 21
{% endblockquote %}
{% pullquote %}
Surround your paragraph with the pull quote tags. Then when you come to
the text you want to pull, {" surround it like this "} and that's all there is to it.
{% endpullquote %}


### 
