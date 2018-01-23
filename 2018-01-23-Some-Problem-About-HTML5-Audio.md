---
layout: post
title: 关于audio标签的两个问题
categories: [blog ]
tags: [JavaScript, HTML, ]
description:  解决HTML5多个audio标签可同时播放的问题，以及在Chrome浏览器里面audio播放器进度条不动的问题
---

近日，项目中在展示音频素材时发现两个问题，一是多个audio及video标签可以同时播放；二是在Chrome浏览器里面，第一次播放音频时播放器的进度条不会动，但是video标签不会有这个问题，网上看了很多人的说法，尝试了也没用，最后呢，我就只能把播放器隐藏起来，弄个按钮控制音频播放。

具体代码实现是这样的：
```
html代码：
因为audio的duration属性没用，所以直接用的后台传过来的数据
<button class="btn btn-default audio">
  <span>播放</span>
  <audio src="音频URL" name="音频时长'">您的浏览器不支持音频播放</audio>
</button>
<span class="currentTime"></span>

JS代码：
$('#audioTable').on('click', 'td button.audio', function(){
  var $audio = $(this).find("audio"),
      $span = $(this).find('span');
  if(playing) {
    if($span.text() == '暂停'){ // 即当前播放的音频是当前点击事件的音频
      $span.text('播放');
      playing = false;
      currentAudio.pause();
      return;
    }else{
      $('button.audio').each(function(){
        $(this).find('audio').get(0).pause();
        $(this).find('span').text('播放');
      });
    }
  }
  $span.text('暂停');
  playing = true;
  currentAudio = $audio.get(0);
  currentAudio.play();
  var progressTimer = setInterval(function(){
    var duration = $(currentAudio).attr('name');
    if(!currentAudio.ended){
      if(playing){
        //更新当前时间
        getCurrentTime(currentAudio);
      }
    }else{
      clearInterval(progressTimer);
      $span.text('播放');
      playing = false;
      // console.log('stop')
    }
  },100);
});

// 更新时间函数
function getCurrentTime(audio){
  var currentTime=audio.currentTime;
  var totalTime=parseInt(currentTime/60);
  var seconds=parseInt(currentTime%60);
  if(totalTime==0){
    if(seconds>9){
      totalTime="00:"+seconds;
    }else{
      totalTime="00:0"+seconds;
    }
  }else{
    var totalTimePre,totalTimeNext;
    if(totalTime>9){
      totalTimePre=totalTime;
    }else{
      totalTimePre="0"+totalTime;
    }
    if(seconds>9){
      totalTimeNext=seconds;
    }else{
      totalTimeNext="0"+seconds;
    }
    totalTime=totalTimePre+":"+totalTimeNext;
  }
  // console.log(totalTime);
  $(audio).parent('button').siblings('span.currentTime').text(totalTime);
}
```
