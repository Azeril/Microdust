---
layout: post
title: 使用Layer弹出图片第一次不能居中
categories: [blog ]
tags: [JavaScript ]
description: layer.open弹出图片第一次不能居中
---

我想做一个图片预览的效果，想到插件Layer可以实现弹框的效果，我就想着应该可以使用layer.open来实现点击预览按钮弹出图片。

一切都很顺利，但是试了几次之后，我发现第一次预览图片不能居中，但之后都是可以居中的。

去FLy社区查了一下，发现挺多人遇到这种问题，然后有一个问题下面框架开发者指明了原因：这是因为图片没有加载完成。提问者最后的解决办法就是等图片加载完再弹框。

我试了一下，发现确实是图片没有加载完的原因。具体代码如下：
```
var imgTick;
function isImgLoad(obj, callback) { // 判断图片是否加载完成
  if (obj.complete) {
      clearTimeout(imgTick);
      callback();
  } else {
      imgTick = setTimeout(function () { layer.load(2); isImgLoad(obj, callback); }, 100);
  }
}
/*预览*/
$scope.preview = function(){
  var img = new Image;
  img.src = imgsrc;
  isImgLoad(img, function(){
    layer.closeAll("loading");
    // 如果图片没有加载完成，第一次弹框位置不是居中，会偏右下角
    layer.open({ 
      type: 1,
      title: false, //不显示标题栏
      shade: 0.8,
      id: 'LAY_layuipro', //设定一个id，防止重复弹出
      moveType: 1, //拖拽模式，0或者1
      content: '<img src="'+imgsrc+'" />'
    });
  });
}
```

问题详情：<http://fly.layui.com/jie/2310/>
