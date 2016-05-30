---
layout: post
title: CSS中position不同属性之间的区别
categories: [blog ]
tags: [front-end, ]
description: 介绍CSS中position不同属性之间的区别
---

position属性有四个值可选：static, fixed, relative, absolute.相比之下，relative和absolute的使用更加复杂一点。   
我们先来看一下static和fixed。

# static
>     position: static; /* the default */   

static定位对于所有元素都是默认的。这表明所有的元素默认都是服从标准文档流，只有margin, padding和display属性决定他们的布局定位。此时，left, right, top, bottom属性的设置对static positioned元素无效。

# fiexed
>     position: fixed;   

* fixed position元素相对于视窗来定位
* fixed position元素大小不计入父元素height中。
* fixed position block元素不会继承父元素的width
* margin属性不起作用
* 相对的定位属性（比如left, right或top, bottom）可以用来设置fixed position元素大小    
   
#### Best Practice: 对所有的fiexed元素使用水平和垂直定位    
fixed元素会脱离文档流。因此通常必须配合水平(left or right)和垂直(top or bottom)定位来确定元素位置。   
    
#### margin属性与之前工作方式不同    
在static和relative position时，margin用来调整元素和兄弟元素之间的距离。但因为fixed元素脱离文档流，因此margin不再影响兄弟元素的布局。但此时margin依然可以对自身元素的位置进行调整。（但这完全可以由水平和垂直定位来替代）    
