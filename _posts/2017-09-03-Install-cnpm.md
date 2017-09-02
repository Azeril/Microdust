---
layout: post
title: 安装淘宝npm镜像
categories: [blog ]
tags: [Node.js, ]
description:  安装cnpm出错的解决方案
---

今天想要安装淘宝npm镜像，发现执行网上的命令会出错，命令如下：
```
npm i -g cnpm --registry=https://registry.npm.taobao.org
```
执行命令后会出现如下代码：
```
rollbackFailedOptional: verb npm-session 2170b11369adfa7
```
一会之后会报错，截图如下：

<img src="http://ohhuvbasf.bkt.clouddn.com/170903-1.PNG" />

网上找到解决方法（[看这里](<https://github.com/npm/npm/issues/17246>)）是依次执行下面两条命令，之后既可以安装cnpm了：
```
npm config rm proxy
npm config rm https-proxy
```
<img src="http://ohhuvbasf.bkt.clouddn.com/170903-3.PNG" />
