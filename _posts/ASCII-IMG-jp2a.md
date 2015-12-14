---
layout: post
title: 字符打造的图像迷宫：ASCII 的艺术与 jp2a 的技术
categories: [blog ]
tags: [Tech, Linux, ]
description: 看一看字符世界的優美和神奇
---


本文将分享一个用于 jpg 图片转换为 ASCII 图像的命令行工具 jp2a。

嗯？还是先来说说 ASCII 具体是怎么一回事吧。

## ASCII




## jp2a


## Commands

基础命令：

```jp2a img_name.jpg```


jp2a --color --html --html-fill --background=dark  img_name.jpg

jp2a --size=80x25 --chars=" ...ooxx@@" picture.jpg picture2.jpg

convert somefile.png jpg:- | jp2a - --width=80

jp2a --color --html --background=dark img_name.jpg --width=1000 --output=img_name.html


## Output

关于图片的提取。原本也不算问题。

单纯以 Terminal 下的 ASCII 图像为例。

如果想输出更为精细的图像，那么 output 就得设置为 html 网页格式。而后再由网页再提取具体的图像了。






Chrome 浏览器 + 全屏截图工具 + 图片查看工具 Xee

## Works



## 参考资料

* [Ubuntu Manpage: jp2a - convert JPEG images to ASCII](http://manpages.ubuntu.com/manpages/karmic/man1/jp2a.1.html)