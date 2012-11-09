---
layout: post
title: 一个加快编译速度的方法
date: 2012-11-09 15:44
comments: true
categories: 
    - Program
tags:
    - C++
    - Compile
---

前几天研究Makefile文件，对gcc/g++是如何编译链接程序的过程有了基本认识，
回想以前自己写程序时的一些不好的习惯，整理出来了一个能够加快编译速度的方法，
记录在这里供大家参考。

<!-- more -->


请看下面的代码：

```
// Print.h
class Print {
public:
    void PrintInt(int data);
};

// Print.cpp
#include "Print.h"
#include <iostream>
void Print::PrintInt(int data) {
    std::cout << data << std::endl;
}

// Compute.h
#include "Print.h"
class Compute {
public:
    int Add(int a, int b);
private:
    Print print;
};

// Compute.cpp
#include "Compute.h"
int Compute::Add(int a, int b) {
    int c = a + b;
    print.PrintInt(c);
    return c;
}

// Test.h
#include "Compute.h"
class Test {
public:
    void TestAdd();
private:
    Compute compute;
};

// Test.cpp
#include "Test.h"
void Test::TestAdd()
{
    compute.Add(123, 456);
}

// Main.cpp
#include "Test.h"
int main()
{
    Test test;
    test.TestAdd();
    return 0;
}
```

代码中包含三个类Print、Compute、Test，其中Test需要调用Compute类，Compute类需要调用Print类。
编译链接的顺序如下：

```
根据Print.h、Print.cpp编译得到Print.o
根据Print.h、Compute.h、Compute.cpp编译得到Compute.o
根据Print.h、Compute.h、Test.h、Test.cpp编译得到Test.o
根据Print.h、Compute.h、Test.h、Main.cpp编译得到Main.o
根据Print.o、Compute.o、Test.o、Maino链接得到Main(.exe)
```

一旦我们对Print.h文件进行了修改，那么上述所有的编译链接操作，都是需要重新再做一遍。
上述程序的结构非常不利与大型项目，当类文件越来越多的时候，每次修改程序后的编译时间将是噩梦。

我们回过头来，再观察一下上述五个步骤。由于Print.h更改了，第(1)步肯定是需要重做的，
Compute类会调用Print类，第(2)步也是需要重做的，
因为Print.o的重新编译使得最后第(5)步链接操作也是需要重做的。
那么剩下的第(3)(4)步是否可以优化掉了？

答案是显然的。Test.cpp和Main.cpp都是因为Compute.h头文件，间接依赖于Print.h头文件。
只要Compute.h头文件中不要包含Print.h头文件，也就是将包含Print.h的include代码
移动到Compute.cpp中，那么对Print.h的修改，就不会对Test.cpp和Main.cpp有影响了，
也就是说Test.o和Main.o就不需要重新编译了。

也许有人会有疑问， 如果将包含Print.h的include代码移动到Compute.cpp中，
那么Compute.h的成员变量Print print不就没有定义了吗？
没错，上述问题确实存在，但是我们可以将成员变量Print print更改为指针形式
`Print *print`，同时在Compute.h文件中加入声明`class Print;`就可以完美的解决上述问题了。

在大型项目中，如果所有的程序在编写过程中都使用上述方法，
那么单独修改几个文件，不会导致整个项目的重新编译，从而能够大大提高编译速度。

