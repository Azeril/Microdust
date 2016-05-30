---
layout: post
title: HTML中Block元素与Inline元素的区别
categories: [blog ]
tags: [front-end, ]
description: 介绍Block元素与Inline元素的区别
---

position属性有四个值可选：static, fixed, relative, absolute.相比之下，relative和absolute的使用更加复杂一点。   
我们先来看一下static和fixed。

# static
>     position: static; /* the default */
static定位对于所有元素都是默认的。这表明所有的元素默认都是服从标准文档流，只有margin, padding和display属性决定他们的布局定位。此时，left, right, top, bottom属性的设置对static positioned元素无效。

# fiexed
>     position: fixed; 
* fixed position元素相对于视窗来定位
* 最好所有fiexed position元素都有水平定位（left or right）和垂直定位（top or bottom）
* fixed position元素大小不计入父元素height中。
* fixed position block元素不会继承父元素的width
* margin属性不起作用
* 相对的定位属性（比如left, right或top, bottom）可以用来设置fixed position元素大小