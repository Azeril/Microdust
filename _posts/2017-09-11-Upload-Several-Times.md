---
layout: post
title: 图片上传时input file change事件多次触发问题
categories: [blog ]
tags: [JavaScript ]
description: 图片上传时input file change事件多次触发问题解决方案
---

今天发现一个问题，input file的change事件会多次触发，导致我会一次性上传多个文件。

具体情况是这样：我是自己写了一个上传样式，把原生的input file隐藏了，点击上传按钮会触发input file的点击事件，然后选择了图片的话就会调用input file的change事件，确定选择后就会把图片上传至后台。

大概代码：

```
$('.upload').click(function () {
  var $chooseFile = $(this).siblings('input');
  $chooseFile.click();
  $chooseFile.change(function () {
    // 上传图片
  });
});
```

上传后的图片可以删除重新选择，我测试的时候就发现，上传一张图片删掉后，再上传会向后台发起两次上传请求，再删掉再上传会有三次请求，原因好像是input file缺少置空的方法，网上找到的解决办法是先解绑file input的事件再触发change事件就可以了。
```
$('.upload').click(function () {
  var $chooseFile = $(this).siblings('input');
  $chooseFile.click();
  $chooseFile.unbind().change(function () {
    // 上传图片
  });
});
```

参考链接：[http://www.aichengxu.com/javascript/78921.htm]

