---
layout: post
title: Can't bind to 'ngForOf' since it isn't a known property of ...
categories: [blog ]
tags: [angular2, ]
description:  angular2
---

最近事不多，就决定学习一下ng2，之前在看大漠老师的NiceFish，奈何才疏学浅，看不懂，，，于是决定一点点来~~

想了想，先从路由开始吧，在网上找了个嵌套路由的教程，照着写了，也弄成功了，然后就想试一下分页功能

过程中遇到一个问题，浏览器会报如图的错误：

<img src="http://ohhuvbasf.bkt.clouddn.com/20171020101858.png" />

源码:

```
<ul>
    <li *ngFor="let item of infoList">{{item.name}}</li>
</ul>
```

网上查到的原因是没有导入```BrowserModule```或```CommonModule```，因为我使用了懒加载，并且app.module.ts已经导入了```BrowserModule```，所以我只需要在懒加载模块文件中导入```CommonModule```就可以了。

网上查到的答案：<https://stackoverflow.com/questions/34228971/cant-bind-to-ng-forof-since-it-isnt-a-known-native-property>
上面的demo：<https://github.com/Tan12/learn-angular/tree/master/myWeb>
