---
layout: post
title: 按钮点击后出现边框该怎么办
categories: [blog ]
tags: [CSS, 兼容性, ]
description:  记录一下自己遇到的问题
---

# 关于button

今天在做一个demo的时候突然发现，在Google浏览器里面，button标签点击后老是会有一个蓝色的边框，查了一下后发现原来是outline在搞鬼，只要将outline设为none，就可以成功去除这个蓝色边框。

而且，貌似只在chrome里面会出现这种情况，在Firefox跟IE10里就没有，不过不确定IE10以前的版本怎么样。

# 关于a标签

button解决后我去看了下我的博客，发现我博客的a标签在Firefox跟IE10里面点击后周围会出现虚线边框，估计IE以前的版本也会有这种情况。网上查到的资料是说这个虚线边框就是outline，它是不占据任何宽度的，a标签失去焦点虚线框才会消失。将其outline设为none，在Firefox即IE8及以上会取消虚线框，但是IE6、IE7都不能实现。

我在网上查到了好几种方法：

1、在a标签聚焦时使用js强制取消焦点。

    $('a').click(function(){
        $(this).blur();
    });

2、在a标签里面嵌套其他标签，如span，把内容放在被嵌套的标签里面，点击时聚焦的是a标签的子标签，不会聚焦在a标签上。

3、使用其他标签代替a标签，并用js做出hover效果，并设置css为cursor:pointer，即可设置hover事件发生时鼠标指针为手指形状。

4、在css中加入以下代码：

    a {outline: none;}
    a:active {star:expression(this.onFocus=this.blur());}
    :focus { outline:0; }

5、直接在a标签里添加js事件：

    <a href=”#” onFocus=”this.blur()”></a>


根据我的尝试，第二种跟第四种方法并没有产生作用，第三种方法我以前用过是可行的，第一种跟第五种方法可以生效，不过第五种方法不利于维护，所以比较推荐第一种方法。
