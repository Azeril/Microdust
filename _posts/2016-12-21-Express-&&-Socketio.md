---
layout: post
title: 实现基于express4+socket.io的web聊天室
categories: [blog ]
tags: [Node.js, websocket, ]
description:  学习node.js与socket.io
---

上个礼拜用jQuery的ajax做了一个在线聊天室，当时就想到，使用ajax需要一直不断地向服务器发起请求看有没有新消息，没有新消息的时候很浪费性能，有没有什么更好地解决办法呢？

之后就看到了webSocket， 只需要经过一次HTTP请求，就可以做到源源不断的信息传送了。其实这东西之前看HTML5新特性的时候就看到过，就是没有深入了解。上网找资料发现大家使用websocket都是用的socke.io，于是我又去跑看socket.io是什么，然后又发现大家学习socket.io都是先做一个聊天室，于是又跑去找聊天室的demo，最后选定了[这个](http://blog.fens.me/nodejs-socketio-chat/)。这个程序是基于express3+socket.io的，我一开始也不会，就照瓢画葫芦，也算是搞了一个聊天室出来，不过完全是照着别人做的，总感觉这不是自己的东西。

好歹思路是有了，于是我想先把express3升级到express4，结果在源程序上面改总也实现不了。我是用的chrome浏览器，老是会报找不到socket.io.js文件、或是socket.io请求数据遭服务器拒绝的错，我bing了也Google了，就是没解决这个问题。有人说浏览器的localhost跟127.0.0.1可能是不同域，这个原因看起来还是蛮靠谱的，可惜我改了hosts文件也没用，，，其他方法我也试过，什么在/socket.io/socket.io.js前面加上http://localhost啊、修改引入socket.io的写法、甚至修改/bin/www文件也没用，，，

于是我决定用express4重新做一个聊天室出来。一开始我依旧在chrome浏览器里面调试，结果一开始蛮好的，一引入socket.io模块浏览器就开始报错。我无奈之下换了Firefox调试，结果一点问题没有，于是我就自己一步一步的做了一个web在线聊天室出来。很有成就感，因为这个真的是我自己构思花了三天时间实现的，除了样式跟功能是参考了[这个](http://www.plhwin.com/2014/05/28/nodejs-socketio/)~~咳咳，不管怎样，做出一个项目就是好样的！

源码地址：<https://github.com/Tan12/NodeJS/tree/master/express4-websocket-chat>
