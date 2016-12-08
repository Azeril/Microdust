---
layout: post
title: 瀑布流布局
categories: [blog ]
tags: [HTML, CSS, ]
description:  用jQuery实现瀑布流布局
---

昨天尝试了一下自己写瀑布流布局，也试了个插件masonry。

感觉以前一直觉得很深奥的东西，深入了解了一下也不是那么难，不过也可能是因为我只是了解了一点皮毛，哈哈~

所谓瀑布流布局，其实就是异步加载，页面随着鼠标不断往下滑，图片会不断加载进来。一开始是pintrest在用，之后如花瓣、淘宝也都采取了这种加载方式。

今天我就来说一下我用jQuery写的一个简单瀑布流布局。首先在html定义一个.container div，用于放置待会要加进来的图片模块。之后在这个div里面建立n个（看自己需要啦）.item div，用于放置图片及描述信息，具体代码如下：

```
<body>
  <div class="container">
    <div class="item">
      <img src="imgs/1.jpg" />
      <p>img1</p>
    </div>
    <div class="item">
      <img src="imgs/2.jpg" />
      <p>img2</p>
    </div>
    ...
    <div class="item">
      <img src="imgs/10.jpg" />
      <p>img10</p>
    </div>
  </div>
</body>
```

设置.item的样式为向左浮动，这样div就能并排显示了，具体css代码如下：

```
.item{
      padding: 10px;
      border: 1px solid #ccc;
      margin: 10px 10px;
      float: left;
    }
```

然后就是用js来实现布局了。首先，图片宽度要一致，这样才方便计算能放多少列图片。其次，我们需要知道当前窗口的宽度，由此可结合.item的宽度算出当前窗口能排多少列div。排列的依据是找到当前高度最短的列，把图片插进去，更新此列高度。由此，我们可以用一个数组hArr[]来存储每列的高度，每列的高度即当前列所有div以及间距相加的高度。

插入图片的具体步骤是，先将第一行塞满，更新hArr[]，插入第二行图片时，先查找出hArr[]中最短的一列高度为minH，将图片的top值设为minH，left值为.item宽度*当前列序号，并更新此列高度为minH+图片的outerHeight(true)。
    
    *outerHeight()用于获取元素的高度+padding，参数为true时，再+margin
     
具体js代码如下：

```
function waterFall(){
      var $items = $('.item'),
          w = $items.eq(0).outerWidth(true),
          cols = Math.floor(($(window).width() - 30) / w),
          hArr = []; // 用于存储每列中的所有块相加的高度

      $('container').width(w*cols);
      $items.each(function(index, value){
        var h = $items.eq(index).outerHeight(true);
        if(index < cols){
          hArr[index] = h; //第一行中的块先添加进数组
        }else {
          var minH = Math.min.apply(null, hArr),
              minHIndex = $.inArray(minH, hArr); // 返回hArr中高度最短的位置
          $(value).css({
            'position' : 'absolute',
            'top' : minH + 'px',
            'left' : minHIndex*w + 'px'
          });
          hArr[minHIndex] += $items.eq(index).outerHeight(true);
        }
      });
    }
```

接下来，只要在页面元素加载完成后执行waterFall()函数就能实现瀑布流布局了。

```
window.onload = waterFall();
```

再改进一点的话可以增加滚动条监听事件，当最后一张图片即将全部显示时即加载新图片进来。

我们需要创建一个checkScrollSide()函数来判断什么时候可以加载新图片进来，我们需要先找到最后一个.item，算出它当前距离文档页面的高度（即偏移量）及它1/2的高度之和为$lastItemDis，如果$lastItemDis小于了滚动条的高度，则加载新图片进来。具体代码如下：

```
function checkScrollSide(){
      var $lastItem = $('.item').last(),
          $lastItemDis = $lastItem.offset().top + Math.floor($lastItem.outerHeight()/2),
          scrollTop = $(window).scrollTop();
      return ($lastItemDis < scrollTop) ? true : false;
    }
```

创建滚动条监听事件：

```
$(window).scroll(function() {
      if(checkScrollSide()){
        $('.container > div').last().removeClass('hide');
      }
      waterFall();
    });
```

因为这只是个demo，所以我是先让部分.item包含在一个div里面隐藏了，当滚动条监听事件发生时，再让这个div显示。

这样一个瀑布流布局就大概实现了。不过这还有个问题，当你改变浏览器窗口时，你会发现，虽然布局也在随之改变，但是它有时不能正常显示，为了解决这个问题，我新加了一个监听窗口resize事件，当改变窗口大小时，重新调用waterFall()函数调整布局。具体代码如下：

```
$(window).resize(function(){
      clearTimeout(re);
      var re = setTimeout(waterFall, 100);
      }, 100);
    });
```

为了防止缩放浏览器窗口时不断地触发事件，我使用了一个定时器，窗口发生变化后开始计时，如果这段时间内窗口还在变化则重新计时，否则调用waterFall()函数。

不过我这样改了之后，窗口大小改变时页面布局还是会出现问题，没办法，我把调用waterFall()函数换成了刷新页面，这才使得窗口大小改变布局更新正常的问题，，，，

```
var re = setTimeout(function(){
        location.reload();
      }, 100);
```

源码地址：https://github.com/Tan12/HTML-CSS3/blob/master/pubuliu/demo-try.html

参考文章：http://www.cnblogs.com/fuhuixiang/p/4340205.html

         http://cued.xunlei.com/log031
