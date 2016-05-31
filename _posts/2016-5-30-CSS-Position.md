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
* **fixed position block元素不会继承父元素的width**
* margin属性不起作用
* 相对的定位属性（比如left, right或top, bottom）可以用来设置fixed position元素大小    
   
#### Best Practice: 对所有的fiexed元素使用水平和垂直定位    
fixed元素会脱离文档流。因此通常必须配合水平(left or right)和垂直(top or bottom)定位来确定元素位置。   
    
#### margin属性与之前工作方式不同    
在static和relative position时，margin用来调整元素和兄弟元素之间的距离。但因为fixed元素脱离文档流，因此margin不再影响兄弟元素的布局。但此时margin依然可以对自身元素的位置进行调整。（但这完全可以由水平(left or right)和垂直(top or bottom)定位来替代）

# relative
>     position: relative;     

relative position和默认的static差不多，他们都遵循正常的文档流，都支持margin, padding对其元素进行布局。但是与static不同的是，relative元素同时支持定位属性（left, right, top, bottom）的设置。此时relative元素会相对元素本身在文本流中的位置，进行偏移。如下图所示。
![这里表示relative元素相对本身位置进行定位](https://github.com/tank0317/tank0317.github.io/blob/master/images/CSS-Position/1.PNG?raw=true)   
从上图可以看到，relative元素，无论是否进行定位，元素依然占据原来的空间。    
下面是relative元素特殊的三个性质：
* 元素的定位（left or top）设置不影响其他兄弟元素
* **对立的定位属性（如left, right或top, bottom）不能同时使用**
* 不再具有自动调整大小的能力
     
#### 不再具有自动调整的能力    
对于Block元素来说，默认继承父级元素的width。但是当使用margin-left或margin-right时，浏览器会对没有明确设置大小的block元素，进行自动的调整。但是当设置positon: relative后，通过left或top对元素定位，将不再有这种自动的调整。如下图所示   
![这里表示通过left或top对元素定位，将不再有这种自动的调整](https://github.com/tank0317/tank0317.github.io/blob/master/images/CSS-Position/2.PNG?raw=true)    
#### 不能同时使用对立的定位属性    
这一点对于fixed和absolute元素，同时使用可以设置元素的大小。而relative元素同时使用，不同浏览器可能会有不同的结果。   

# absolute
>     position: absolute;     

absolute元素，和fixed元素相同，会脱离正常的文档流，这个和static, relative元素不同。
* absolute position元素相对于父级或祖父级positioned元素（非static）来定位
* absolute position元素大小不计入父元素height中。
* ** absolute position block元素不会继承父元素的width**
* margin属性不起作用
* 相对的定位属性（比如left, right或top, bottom）可以用来设置absolute position元素大小
* Best Practice: 对所有的fiexed元素使用水平和垂直定位    

除去第一条，absolute元素和fixed元素的性质相同。
    
#### fixed position元素相对于父级或祖父级positioned元素（非static）来定位    

可以直接看下图    
![fixed position元素相对于父级或祖父级positioned元素（非static）来定位](https://github.com/tank0317/tank0317.github.io/blob/master/images/CSS-Position/3.PNG?raw=true)    
当父级元素都不是positioned元素时，absolute元素会相对于&lt;body&gt;元素定位。    

#### absolute position元素大小不计入父元素height中

直接看下图    
![absolute position元素大小不计入父元素height中](https://github.com/tank0317/tank0317.github.io/blob/master/images/CSS-Position/4.PNG?raw=true)    
这一点其实容易理解，absolute元素脱离了文档流，因此不再对父元素产生影响。使用过程中会经常遇到这种情况。

本文翻译自edx课程：W3Cx: HTML5.0x HTML5 Introduction
[原文链接](https://courses.edx.org/courses/course-v1:W3Cx+HTML5.0x+1T2016/courseware/306cfa0313a449a29b2dbcb0b2afcb86/1fe35eaba7534b5d86b69fa0e09494a3/)