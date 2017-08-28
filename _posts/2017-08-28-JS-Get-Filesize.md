---
layout: post
title: js获取文件大小
categories: [blog ]
tags: [Javascript, ]
description:  用于限制上传文件大小
---

因为项目中需要上传图片，并且需要限制图片的大小，所以我需要使用js来获取到上传图片的大小。具体操作如下：

获取上传文件框对象：

```
js:
var file = document.getElementById('file');
jq:
var file = $('#file')[0];
```

接下来就可以获取到上传文件大小了：

```
var size = file.files[0].size;
```
