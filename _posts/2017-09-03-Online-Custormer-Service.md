---
layout: post
title: 在线客服系统
categories: [blog ]
tags: [PHP, websocket, ]
description:  大概讲了一下怎么做的这个客服系统
---

这个客服系统我采用了GatewayWorker这个php框架，它是基于Workerman开发的一个项目框架，用于快速开发TCP长连接应用，借助它我很容易就实现了前后台的通信。

客服系统下载地址：https://github.com/Tan12/online-custormer-service。

GatewayWorker下载及手册地址：http://www.workerman.net/doc。

要使用workerman系列框架需要你电脑的php版本 >=5.3.3，下载php地址：http://windows.php.net/download ，下载后配置环境变量的步骤如图：

<img src="http://ohhuvbasf.bkt.clouddn.com/install-php.gif" />

环境配好了，那就可以启动客服系统了。直接双击启动根目录里的start_for_win.bat就可以开启服务了，如图：

<img src="http://ohhuvbasf.bkt.clouddn.com/chatonline-1.png" />

这个客服系统是一个客服对应多个用户的。在浏览器里面访问 http://localhost:2347 就可以进入前台页面，用户点击如下图浮动的客服图标即可发起聊天，若后台客服登录了，则弹出聊天框，否则提示客服不在线。

<img src="http://ohhuvbasf.bkt.clouddn.com/chatonline-2.png" />

<img src="http://ohhuvbasf.bkt.clouddn.com/chatonline-3.png" /> 

在聊天过程中如果客服离线会收到提醒，不过客服重新上线后，之前跟用户的聊天记录都会没有了。

<img src="http://ohhuvbasf.bkt.clouddn.com/chatonline-4.png" /> 

在浏览器里面访问 http://localhost:2347/server.html 即可访问后台客服聊天界面，具体样式如下，比较简单，嘿嘿。

<img src="http://ohhuvbasf.bkt.clouddn.com/chatonline-5.png" /> 

客服点击相应的用户即可和其聊天，其他用户发来新消息有如下提醒：

<img src="http://ohhuvbasf.bkt.clouddn.com/chatonline-6.png" /> 

当用户离线后，客服会收到提醒，并可以选择关闭聊天框：

<img src="http://ohhuvbasf.bkt.clouddn.com/chatonline-7.png" /> 

还有就是，客服跟用户聊天时，聊天框始终显示最新消息，及聊天框滚动条始终置底。

大概的功能就是上面这些，下面大概讲一下代码吧。

下面是服务端监听消息（Events.php）的代码，消息主要分为两大类，一是来自用户端的，一是来自客服端的。

用户端比较简单，消息都是发给客服端的。

客服端消息处理复杂一点，因为只能一个客服在线，所有进入客服端的时候，需要先判断一下当前是否有客服已经在线了，如果有的话则跳转404页面，否则就为客服绑定唯一uid。如果是客服不小心掉线再重新上线的话，这就需要广播通知之前与她聊天的用户。

注：服务器端的代码改了之后需要重启服务才能生效。

```
public static function onMessage($client_id, $message){
    global $online;
    global $sid;
    // 因为一开始做的是多个客服的，所以设置了一个“userlink”的消息类型用来表示用户刚发起ws连接
    // 用以返回在线客服列表，用户即可选择客服聊天
    // 后来是因为只需要一个客服就没做那么多了
    // 这些设置就先留着了，以防以后有需要再改
    // 所有这个“userlink”不用管，用户端主要就是把消息发给客服端
    if($message !== 'userlink'){
      $message = json_decode($message);
      $message->time = date('Y-m-d H:i:s');
      if($message->type === 'server'){
        // 消息类型为“server”是客服端发来的消息
        if(!$online){
          // 如果当前没有客服在线，则为当前客服绑定她的uid
          // 这样不论客服刷新多少次，只要她重新上线，用户就能根据这个uid找到她
              Gateway::bindUid($client_id, $message->from);
          $online = $message->from;
              $sid = $client_id;
          // 获取当前与该客服聊天的用户，将客服上线的消息广播给他们
              if(Gateway::getClientCountByGroup($message->from)){
            $message->type = 'ifonline';
            $message->msg = '当前客服已上线';
            Gateway::sendToGroup($message->from, json_encode($message));
              }
        }else if($client_id === $sid){
          // 如果是当前在线的客服，则将消息发给当前与客服聊天的用户
                if($message->to && $message->msg){
                  Gateway::sendToClient($message->to, json_encode($message));
                }
            }else{
          // 如果当前已有客服在线，则返回提示信息，客服端将做出对应处理
                $msg->type = 'someone';
                $msg->msg = '当前已有客服在线';
                Gateway::sendToClient($client_id, json_encode($msg));
            }
        //echo($online);
      }else if($message->type === 'user'){
        // 消息类型为“user”是用户端发来的消息
        $message->from = $client_id;
        Gateway::joinGroup($client_id, $message->to); // 将同一个客服的用户归到一组
        //var_export(Gateway::getClientSessionsByGroup($message->to));
        $message->userlist = Gateway::getClientSessionsByGroup($message->to);
        Gateway::sendToUid($message->to, json_encode($message));
      }
    }else{// 用户刚接入，返回在线客服数组
      $msg->type = 'online';
      $msg->online = $online;
      Gateway::sendToClient($client_id, json_encode($msg));
      //echo "linked";
    }
  }
```

接下来看一下用户端监听消息的代码，比较简单，主要就是将收到的消息显示在聊天框中，以及保持聊天框显示最新消息：

```
function getMessage(data){
    //console.log(data);
    var $data = data.data,
        $user2, $section, $p,
        $obj;

    // 判断是不是json数据，不是的话就是欢迎语
    if($data.indexOf('{') !== -1){
      $obj = $.parseJSON($data);
      //console.log($obj)
      if($obj.type === 'server'){
        $section = $('<section>');
        $p = $('<p>').text($obj.msg).addClass('left');
        $message.to = $obj.from;
        $message.from = $obj.to;
        $section.append($p);
        $showMsg.append($section);
        // 使滚动条保持在底部，即显示最新消息
        if(heightChange()){
          $showMsg.scrollTop(height);
        }
      }else if($obj.type === 'online'){ // $obj.online包含了在线客服的号码
        if($obj.online){
          flag = 1;
          $message.to = $obj.online; // 目前只有一个客服
        }else{
          flag = 0;
        }
      }else if($obj.type === 'ifonline' && $obj.msg){
        var $section = $('<section>'),
            $p = $('<p>').text('系统提示：' + $obj.msg).addClass('center');
        $section.append($p);
        $showMsg.append($section);
      }
    }else{
      console.log($data);
    }
  };
```

最后是客服端的监听消息的代码，有点多，不过注释写的挺详细，应该能看懂吧~

客服端比用户端要复杂一点，因为一个客服需要与多个客服同时聊天，所以我在每新增一个用户的时候就为该用户新建一个对应的聊天框。

当客服选择用户1聊天时，则将聊天框show-msg-1至于页面最上层，并将消息添加到该聊天框。

用户离线后，聊天框不会立即关闭，用户会收到用户离线的系统提示，然后可以自主关闭聊天框。

```
ws.onmessage = function(msg){
    //console.log(msg);
    var $data = msg.data,
        $user2,
        $obj,
        user_id; // 用户唯一id

    // 判断是不是json数据，不是的话就是欢迎语
    if($data.indexOf('{') !== -1){
      $obj = $.parseJSON($data);
      //console.log($obj)
      if($obj.type === 'user'){
        var $section = $('<section>'),
            $p = $('<p>').text($obj.msg).addClass('left');
        $section.append($p);

        // 如果是新用户则添加到用户列表，且新建一个聊天框
        if(!in_array(cur_users, $obj.from)){
          cur_users.push($obj.from);
          num++;
          $userList.find('input:radio').attr('checked', false);
          $userList.find('label').removeClass('current');
          // 添加到用户列表
          var $div = $('<div>').addClass('tags');
              $close = $('<span>').text('x').addClass('close').hide(),
              $label = $('<label>').attr('for', 'user'+num).text('用户' + num).addClass('current'),
              $radio = $('<input>').attr({'type':'radio','id':'user'+num,'value':$obj.from,'name':'user',"checked":true}).addClass('hidden');
          $div.append($radio).append($label).append($close);
          $userList.append($div);

          // 切换聊天用户
          // 绑定点击事件，当前函数之外绑定无效
          // 绑定已定义函数点击事件只能生效一次，so~
          $radio.on('click', function(){ // 切换聊天用户
            $userList.find('label').removeClass('current');
            $userList.find('input:radio').attr('checked', false);
            $(this).attr('checked', true);
            $(this).next('label').addClass('current').removeClass('new');
            var index = $(this).attr('id').substr($(this).attr('id').length-1,1);
            //console.log(index);
            // 将选中的用户聊天框置顶，其他聊天框移去置顶class样式
            $('#show-msg-' + index).addClass('current-user').siblings('div[id^=show-msg]').removeClass('current-user');
          });

          // 关闭事件
          // 只有用户退出后才能关闭聊天框
          $('.close').on('click', function(){
            var del_u = $(this).siblings('label').attr('for'),
                del_n = del_u.substr(del_u.length-1, 1);
            // 从用户列表中移除退出的用户
            $(this).parent('div').remove();
            // 移除聊天框
            $('#show-msg-' + del_n).remove();

            // 将当前用户列表中的第一个用户置顶
            if($userList.children('div')){
              $userList.find('label').removeClass('current');
              $showBox.children('div').removeClass('current-user');
              $userList.children('div').eq(0).children('label').addClass('current');
              var top_u = $userList.children('div').eq(0).children('label').attr('for'),
                  top_n = top_u.substr(top_u.length-1, 1);
              $('#show-msg-' + top_n).addClass('current-user');
              $('#user' + top_n).attr('checked','checked');
            }
          });

          // 新建聊天框
          var id_name = 'show-msg-' + num,
              $div  = $('<div>').attr('id', 'show-msg-' + num);
          $div.addClass('current-user').append($section);
          $showBox.append($div);
          $div.siblings('div[id^=show-msg]').removeClass('current-user');
          height[num] = $div.height(); // 存储每个聊天框的初始高度
        }else{
          // 如果是已经在聊天的用户则找到对应聊天框添加对话
          tag = userNum($obj.from);
          var $curDiv = $('#show-msg-' + tag);
          $curDiv.append($section);

          // 添加消息提醒
          var $la = $('label[for=user'+ tag +']');
          if(!$la.hasClass('current')){ // 当前聊天框不是要添加消息的地方
            $la.addClass('new');
          }

          // 使滚动条置于底端
          if(heightChange($curDiv[0].scrollHeight, tag)){
            $curDiv.scrollTop(height[tag]);
          }
        }
      }else if($obj.type === 'logout'){ // 有用户退出，只有type跟from有值
        console.log($obj.from + 'logout');

        // 离开用户的聊天界面提示“用户离开”
        var $list = $userList.find('input');
        for(var j = 0, n = $list.length; j < n; j++){
          if($list.eq(j).val() === $obj.from){
            var u = $list.eq(j).siblings('label').attr('for'),
                n = u.substr(u.length-1, 1);
            var $section = $('<section>'),
                $p = $('<p>').text('系统提示：该用户已离开').addClass('center');
            $section.append($p);
            $('#show-msg-' + n).append($section);
            $list.eq(j).siblings('span').show();
          }
        }
      }else if($obj.type === 'someone'){ //有客服在线了，只有type跟msg有值
         alert($obj.msg);
         window.location = '404.html';
      }
    }else{
      console.log($data);
    }
  };
```


