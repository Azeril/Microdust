---
layout: post
title: 番茄钟
categories: [blog ]
tags: [AngularJS, ]
description:  制作一个倒计时时钟
---

其实还是有点不想写东西，不过为了治疗我的懒癌，还是决定趁有时间先写点，不求一下子写完，慢慢来吧。

今天打算写篇关于番茄钟的博客，之前老想着写篇关于2048的博客，但一直没动手，之后补上吧，，，

番茄钟其实就是一个倒计时的时钟，你可以加减倒计时的时间，每一次倒计时结束会有一个时间间隔，这个break time也是可以加减的，break time结束后继续倒计时。

<img src="http://ohhuvbasf.bkt.clouddn.com/161206-01.png" />

我们要实现的功能有：

1.    倒计时开始，不能加减时间
2.    session time 结束自动进入break time倒计时，反之亦然
3.    时钟背景随着时间减少逐渐填充


我用的是angularjs写的，这样显示一直的变化时间比较方便一点。


首先是布局，使用html和css实现。

   html代码：
    
```
<body>
    <div class="container">
        <h1>番茄钟</h1>
        <div class="session">
            <div class="breakCtrl">
                <p>break length</p>
                <button class="minus">-</button>
                <span></span>
                <button class="add">+</button>
            </div>
            <div class="sessionCtrl">
                <p>session length</p>
                <button class="minus">-</button>
                <span></span>
                <button class="add">+</button>
            </div>
        </div>
        <div class="timer">
            <p class="title"></p>
            <p></p>
            <span class="fill"></span>
        </div>
    </div>
</body>

```

   css代码：

```
body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, form, fieldset, input, p, blockquote, table, th, td, embed, object {
    padding: 0;
    margin: 0;
}
body{
    color: #fff;
    height: 100%;
    font-size: 16px;
    font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
    overflow: hidden;
    background-color: #333;
}
.container{
    width: 80%;
    margin: 0 auto;
    margin-top: 10%;
}
h1{
    text-align: center;
    margin: 50px 0;
}
button{
    color: #fff;
    border: 0 none; /* 前面的0是针对ie6和ie7的兼容，后面的none是针对标准浏览器的 */
    background-color: transparent;
    outline: none;
}
.session{
    display: flex;
    justify-content: center;
}
.session p{
    font-size: .8em;
    line-height: 200%;
    text-transform: uppercase;
}
.session span{
    font-size: 2.5em;
    padding-left: 10px;
    padding-right: 10px;
}
.breakCtrl, .sessionCtrl{
    display: inline;
    padding: 0 30px;
    text-align: center;
}
.minus, .add{
    font-size: 2em;
    bottom: 0;
}
button, .timer{
    cursor: pointer;
}
.timer{
    width: 200px;
    height: 200px;
    border-radius: 50%;
    border: 2px solid #99CC00;
    margin: 20px auto;
    text-align: center;
    font-size: 3em;
    position: relative;
    z-index: 20;
    overflow: hidden;
}
.timer:before {
    content: '';
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    border-radius: 50%;
    z-index: 2;
    border: 4px solid #333;
}
.title{
    margin-top: 20%;
    margin-bottom: 10%;
}
.fill{
    right: 0;
    bottom: 0;
    left: 0;
    position: absolute;
    z-index: -1;
    background-color: #3a87ad;
}
```

这个就不详细说了，下面主要讲一下怎么使用angularJS来实现这个倒计时的功能。

1、 引进angular.min.js跟jquery-3.1.1.min.js之后，将整个body作为AngularJS脚本作用域及控制器，并在需要动态改变数据的地方加上angular js变量。

```
<body ng-app="timerApp" ng-controller="timerCtrl">
    <div class="container">
        <h1>番茄钟</h1>
        <div class="session">
            <div class="breakCtrl">
                <p>break length</p>
                <button class="minus">-</button>
                <span>{{breakLength}}</span>
                <button class="add">+</button>
            </div>
            <div class="sessionCtrl">
                <p>session length</p>
                <button class="minus">-</button>
                <span>{{sessionLength}}</span>
                <button class="add">+</button>
            </div>
        </div>
        <div class="timer">
            <p class="title">{{sessionName}}</p>
            <p>{{timeLeft}}</p>
            <span class="fill"></span>
        </div>
    </div>
</body>
```

在js中定义初始变量值：

js代码：

```
var app = angular.module('timerApp', []);
app.controller('timerCtrl', function ($scope, $interval) {
    $scope.breakLength = 5; // 定义间隔时长初始值
    $scope.sessionLength = 10; // 定义倒计时初始值
    $scope.sessionName = 'session'; // 定义当前时间的名称，即session与break
    $scope.timeLeft = $scope.sessionLength; // 定义剩余时长

    $scope.originTime = $scope.sessionLength; // 存储倒计时初始时长
    $scope.fillHeight = '0%'; // 背景填充高度

    var runTimer = false,  // 标记计时器有没有在运行，默认没有
      seconds = 60 * $scope.timeLeft; //将时长转化为秒数
}
```

2、首先来实现对时长的加减。如图，点击“-”break length会减1，点击“+”break length会加1。

<img src="http://ohhuvbasf.bkt.clouddn.com/161206-02.png" />

定义breakLengthChange 函数，当计时器没有运行（runTime为false）且sessionName是‘break’时，方可对breakLength进行操作，并限定breakLength的值最小为1，重新给timeLeft、seconds、originTime赋值。

```
$scope.breakLengthChange = function (num) {
    if(!runTimer){
        if($scope.sessionName === 'break'){
            $scope.breakLength += num;
            if($scope.breakLength <= 0){
                $scope.breakLength = 1;
            }
            $scope.timeLeft = $scope.breakLength;
            seconds = 60 * $scope.breakLength;
            $scope.originTime = $scope.breakLength;
        }
    }
};
```

在html文件中为‘-’和‘+’添加点击事件，如：

```
<button class="minus" ng-click="breakLengthChange(-1)">-</button>
<button class="add" ng-click="breakLengthChange(1)">+</button>
```

实现对breakLength的更改。

sessionLengthChange 函数跟breakLengthChange功能一样，就不重复说了。

3、接下来实现秒数转H:M:S格式，函数是secondsToHms()，time是传进来的秒数，换算成时分秒的公式很简单，时间是以60为进度的，只要不断除以60就好。最后是返回H:M:S这样的格式，这里用的是三元运算符，意思是，如果h存在的话就h加上“：”再加上m，否则直接m开头，m的判断一样。

```
function secondsToHms(time) {
    var h = Math.floor(time/3600),
        m = Math.floor(time%3600/60),
        s = Math.floor(time%3600%60);
    // 将格式转为00:00:00
    return  (
        (h > 0 ? h + ':' + (m < 10 ? '0' : '') : '') + m + ':' + (s < 10 ? '0' : '') + s
    );
}
```

4、然后是实现倒计时函数（updateTimer()），因为秒数是递减的，所以seconds每次都减1，当秒数小于0了就要切换倒计时类型了，背景填充颜色也要随之切换。填充百分率即当前流失时间占原始时间的百分比，即[（originTime - timeLeft）/originTime ]*100% => (1 - seconds/ori) * 100%。

具体代码如下：

```
function updateTimer() {
    seconds -= 1;
    if(seconds < 0){
        $scope.fillColor = '#333';
        if($scope.sessionName === 'session'){
            $scope.sessionName = 'break';
            $scope.timeLeft = $scope.breakLength;
        }else {
            $scope.sessionName = 'session';
            $scope.timeLeft = $scope.sessionLength;
        }
        seconds = 60 * $scope.timeLeft;
        $scope.originTime = $scope.timeLeft;
    }else {
        if($scope.sessionName === 'break'){
            $scope.fillColor = '#ff4444';
        }else {
            $scope.fillColor = '#99cc00';
        }
    }
    $scope.timeLeft = secondsToHms(seconds);

    var ori = $scope.originTime * 60,
        per = (1 - seconds/ori) * 100;
    $scope.fillHeight = per + '%';
}
```

在html代码中加上ng-style，实现背景随着时间减少不断填充。

```
<span class="fill" ng-style="{'height':fillHeight,'background-color':fillColor}"></span>
```

5、最后就是实现切换倒计时类型的函数了，点击时钟，如果倒计时没有开始，则调用updateTime()，并为其添加计时器1s钟执行一次，实现倒计时效果。反之暂停，移除计时器。

```
$scope.toggleTimer = function () {
    if(!runTimer){
        updateTimer();
        runTimer = $interval(updateTimer, 1000);
    }else {
        $interval.cancel(runTimer);
        runTimer = false;
    }
};
```

为.timer添加n-click事件，即可实现暂停开始倒计时：

```
<div class="timer" ng-click="toggleTimer()">
```

好了，到这就大功告成了！

<img src="http://ohhuvbasf.bkt.clouddn.com/161206-03.gif" />

