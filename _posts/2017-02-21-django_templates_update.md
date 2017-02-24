---  
layout: post  
title: Django 模板进阶   
categories: [blog, ]  
tags: [Django, ]
description: 「Django 模板进阶」  
--- 

## 本节主要讲 Django模板中的循环，条件判断，常用的标签，过滤器的使用。
- 列表，字典，类的实例的使用
- 循环：迭代显示列表，字典等中的内容
- 条件判断：判断是否显示该内容，比如判断是手机访问，还是电脑访问，给出不一样的代码。
- **标签：**for，if 这样的功能都是标签。
- **过滤器：**管道符号后面的功能，比如{{ var|length }}，求变量长度的 length 就是一个过滤器。

如果需要将一个或多个变量共享给多个网页或者所有网页使用，比如在网页上显示来访者的IP，这个可以使用 Django 上下文渲染器 来做。

### 实例一，显示一个基本的字符串在网页上
views.py
```
# -*- coding: utf-8 -*-
from django.shortcuts import render
 
 
def home(request):
    string = u"我在学习Django，用它来建网站"
    return render(request, 'home.html', {'string': string})
```
在视图中我们传递了一个字符串名称是 `string` 到模板 `home.html`，在模板中这样使用它：


### 实例二，讲解了基本的 for 循环 和 List内容的显示

views.py

```
def home(request):
    TutorialList = ["HTML", "CSS", "jQuery", "Python", "Django"]
    return render(request, 'home.html', {'TutorialList': TutorialList})
```
在视图中我们传递了一个List到模板 home.html，在模板中这样使用它：
home.html
```
教程列表：
{% for i in TutorialList %}
{{ i }}
{% endfor %}
```