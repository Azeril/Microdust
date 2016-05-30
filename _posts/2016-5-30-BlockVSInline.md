---
layout:     post
title:      "HTML中Block元素与Inline元素的区别"
subtitle:   ""
header-img: "img/autumn2.jpg"
description: 
categories: [blog ]
tags: [front-end, ]
---



# Block元素

* 总是出现在前一个Block元素的左下方（重新开始一行）
* **默认继承父级Block元素的width**
* 遵循所有的margin属性
* 可以设置width属性（如果宽度太小可能会导致子元素换行）
* 若height未设置，默认为所有子元素height之和
* 忽略vertical-align属性

# inline 元素

* 总是出现在上一个元素的右边（除非必须换行的时候）
* **width默认为content的宽度**
* **忽略top/bottom-margin设置**
* **忽略width/height属性**
* 遵循vertical-align/white-space属性
* **支持padding，但是padding-top/bottom不会影响行高**
* inline element cleave to the baseline where they are being placed（我还不是很理解）

下面的例子我们可以看出，对于inline元素忽略margin-top，同时padding-top/bottom不会影响行高。  
![这张图片表明对于inline元素忽略margin-top，同时padding-top/bottom不会影响行高](https://github.com/tank0317/tank0317.github.io/blob/master/images/BlockVSInline/2.PNG?raw=true)
上图中我们会看到<span>部分的背景会和上下两侧发生重叠，此时我们可以用line-height来避免这种现象。  
![这张图片示范使用line-height改变inline元素的行高](https://github.com/tank0317/tank0317.github.io/blob/master/images/BlockVSInline/1.PNG?raw=true)  

此时我们再看一下什么是inline-block  
# inline-block元素

* 支持margin-top/bottom设置
* padding-top/bottom设置会对行高产生影响
* 支持width/height属性

当把inline元素设置为display:inline-block时，我们看一下有什么变化。
![这张图片表示当使用display:inline-block时对inine元素的影响](https://github.com/tank0317/tank0317.github.io/blob/master/images/BlockVSInline/2.PNG?raw=true)   

对大多数浏览器而言，&lt;img&gt;&lt;botton&gt;&lt;input&gt;&lt;select&gt;元素都默认是inline-block元素。