---
layout: post
title: Markdown 简明语法参考
categories: [blog ]
tags: [Mac, ]
description: 这是一份基本版的 Markdown 语法清单
---

## Markdown 概述

博文正文一般使用 Markdown 语法写作。当然，用 txt 格式也可以，但查看起来会很丑很丑...

Markdown 语法是对纯文本格式的强化，能使文本显示得更清晰、有条理。但它依旧算是简单的文本，很容易修改和扩展，常用于快速写作之中。

Markdown 格式的简洁特性、兼容性好，使之能快速转换为各种互联网上的常用格式，比如 HTML、Word、PDF 等，所以目前越来越常用。

## Markdown 编辑器

常见及常用的 Markdown 编辑器很多，比如：

* [MacDown](http://macdown.uranusjr.com/)
* [Mou](http://25.io/mou/)
* [Typora](http://typora.io/)  

此外还有（收费为主）：

* [Scrivener](http://www.literatureandlatte.com/scrivener.php)
* [Typed](http://realmacsoftware.com/typed/)
* [iA | Writer for Mac](https://ia.net/writer/mac/)
* [Byword](http://bywordapp.com/)
* [Marked 2](http://marked2app.com/)
* [Ulysses](http://www.ulyssesapp.com/)
* [Marboo](http://marboo.io/)

以及支持 Markdown 的优质在线编辑器：

* [马克飞象](http://maxiang.info/)
* [Dillinger](http://dillinger.io/)
* [StackEdit](https://stackedit.io/)
* [Markable](http://markable.in/editor/)

 入门编辑器推荐第一序列的前两款 MacDown 及 Mou，其它编辑器可以等熟悉 Markdown 之后再自行探索。
 


# Markdown 语法

关于 Markdown 的基本语法，这里将逐一说明。对于一些写作中一般不算常用（不好用）的表格及代码展示，不多说明。

基本所有以下涉及的标点都以在英文输入状态下的为准。不然会导致语法失效。

先看一个包含了蛮多基本语法的范例。

![Markdown](http://dreamofbook.qiniudn.com/Markdown-Sample.png)

关于语法，让我们先从在文中起到分清区块、梳理逻辑关系的标题说起：

## 各级标题：

    # 一级标题
    ## 二级标题
    ### 三级标题
    #### 四级标题
    ##### 五级标题

显示效果如下：

# 这是一级标题  
## 俺，二级标题  
### 我是三级标题  
#### 人家只是个四级标题...  
##### 更小的我，五级标题 XD 

*** 

## 强调标记
    
    *斜体* 斜体
    _斜体_
    
    **加粗** 加粗
    __粗体_

对于强调符号，需要注意的就是，以什么开始，以什么结尾，数量也保持一致，相应的语法才能生效。

显示效果如下：

这是 *斜体*

这是 **强调**

## 分割线
    
    *** 加分割线
    * * * 加分割线
    ***** 或者这样？
    --- 还有另外的方式
    
以下就是一条分割线：

***

## 列表

无序列表：

    Unordered List:
    
    * English
    * Japanese
    * Chinese

显示效果均如下：

Country List：

* English
* Japanese
* Chinese

或者这样：

    Unordered List:
    
    - 杭州
    - 宁波
    - 温州
    - 湖州
    ……

显示效果如下：

浙江县市列表：
    
- 杭州
- 宁波
- 温州
- 湖州    
……
    
有序列表：

    Ordered List:
    
    1. Orange
    2. Apple
    3. Banana

My Favorite Fruit List:
    
1. Orange
2. Apple
3. Banana

*** 

## 引用

引用。使用「>」，添加在每行的开头。

两个注意点：

1. 「>」的上一行，必须为空行；
2. 「>」与后边添加的第一个字之间，必须有一个空格。

显示效果如下：

詹姆斯·馬奇《馬奇論管理》：

> 堂吉诃德提醒我们，如果我們只在不被辜負時去信任，只在有所回報時去愛，只在學有所用時去學習，那麼我們就放棄了為人的特征——願意在自我理念的名義下行動，不管結果如何。

或者，你想要引用一首诗、一首歌：

    > 五月天《天使》
    
    > 像孩子依赖着肩膀 
    > 像眼泪依赖着脸庞 
    > 你就像天使一样 
    > 给我依赖 给我力量  

这儿需要注意以下：每一行最后换行，需要空两格，不然内容会挤压在一块，变成一行。或者行与行之间，空一行。这是为什么下面的歌名和歌词部分分列为两行，而歌词都汇合为一句了。

> 五月天《天使》 
> 
> 像孩子依赖着肩膀 
> 像眼泪依赖着脸庞 
> 你就像天使一样 
> 给我依赖 给我力量 

每句歌词的行尾空两格之后，效果是这样的：
 
> 五月天《天使》 
>  
> 像孩子依赖着肩膀  
> 像眼泪依赖着脸庞  
> 你就像天使一样  
> 给我依赖 给我力量   

那么如果行尾不空格呢有没其它解决方法呢？
 
    风吹柳絮
    
    《麦兜当当伴我心》插曲

    风吹柳絮 茫茫难聚  
    随着风吹 飘来飘去  
    我若能够携你随风去  

    我愿像一块扣肉  
    我愿像一块扣肉  
    我愿像一块扣肉  
    扣住你梅菜扣住你手  

    我愿像一块扣肉  
    我愿像一块扣肉  
    我是你一块扣肉  
    你是那梅菜扣住你手  

这里的方法是句子开头缩进四个空格。

*** 

## 网址链接

    [Link Name](Link) 

这是网址链接的基本格式。

* 一个方括号，添加图片的描述文字
* 一个括号，添加图片网址

以下为一个在 md 中添加网址的栗子：

    [My Blog](azeril.me)

显示效果如下：

[My Blog](azeril.me)


## 添加图片

插入图片的语法：

    ![Pic name](Pic link)  
    ![Instagram Pic](http://i.imgur.com/UKhrRrK.jpg)

* 一个英文输入下的惊叹号「!」；
* 一个方括号，添加图片的描述文字；
* 一个括号，添加图片网址。

相比插入网址链接，多了一个开头的惊叹号。

显示效果如下：

![Instagram Pic](http://i.imgur.com/UKhrRrK.jpg)

*** 

## 添加图片(进阶版)

![Pic_Sample](http://7s1rzi.com1.z0.glb.clouddn.com/Pic_Sample.jpg)

想要在页面中并排插入多张图片（两张或三张并排显示）或想要将插入的图片居中显示，单纯依靠 Markdown 语法是无法搞定的。这时，就需要借助 HTML 语言。这里提供几个简单的模板，在插入图片时可以套用。

以下，可以仅看添加图床图片的，减少认知负荷。

### 添加图床图片

说到图床，图床是第三方服务托管个人上传图片，并提供图片外链，让我们在写博客文章时使用的方式。

常用图床： 

* [七牛云存储](http://www.qiniu.com/)
* [Imgur](http://imgur.com/)
* [Photobucket](http://s1381.photobucket.com/)

图床在上传图片后会提供一个图片的外链。我们可以利用外链把图片添加到自己的博文中。图片也可以存储在 Github 自己的博客项目里，不过图片蛮占用空间（Github 项目空间为200 M）。因而最好是选图床托管图片。

如果是单纯插入来自图床的图片外链：

单张居中显示：

    <figure>
        <img src="http://xxx.jpg">
    </figure> 
    
两张并排显示：

    <figure class="half">
        <img src="http://xxx.jpg">
	    <img src="http://yyy.jpg">
    </figure>
    
三张并排显示：

    <figure class="third">
        <img src="http://xxx.jpg">
	    <img src="http://yyy.jpg">
	    <img src="http://zzz.jpg">
    </figure>

使用时复制相应的代码粘贴，然后替换 ""(英文输入下的引号) 里的链接，也就是例子中的「http://xxx.jpg」链接为自己上传图片（一般只有在图床上传的图才有这样的链接）的外链。

Tips: 关于 jpg/png 都是常用文件格式，jpg 格式压缩效率高，相对文件质量小一点，占用网络空间少，在页面里显示时加载会快一些。png 格式的图片更清晰。

### 添加 Github 图片
    
如果是利用在 Github 项目文件夹里的图片，基本的语法不变，只是将前面提到 "" 里的图片外链（网址）替换为：

    「自定义的域名 + 图片在 Github 项目的位置」

```
{{ site.url }}/images/xxx.jpg
```

引用的代码自动变形了。博文中两个花括号及「site.url」构成的代码块会自动补全为我的个人域名，所以这篇博文代码区中的演示也受到了影响(上一段的引用就受到影响了。后边的文中引用的例子也一样)。如果复制了刚才的代码块，需要将「 azeril.me//」修改成下图中的样子（两个花括号，中间加 site.url ）。即：

![code](http://7s1rzi.com1.z0.glb.clouddn.com/onelinecode.png)

使用时复制和修改相应的代码，并替换「/images/xxx.jpg」这样的链接为自己放置图片的路径。

如果 Github 项目下有 images 文件夹，直接在里面放图，就是如上的代码替换。如果是 images 目录下的文件夹，如 Instagram，则路径为：「images/Instagram/ xxx.jpg」。依此类推。

![](http://7s1rzi.com1.z0.glb.clouddn.com/twolinescode.png)

### 附加浏览窗口的模式

更复杂一点，点击图片可以跳出一个预览窗口，可以看大图和切换图片。

效果如下：

![PreviewPic](http://7s1rzi.com1.z0.glb.clouddn.com/Preview_Pic.png)

两张并排显示的代码（单张和三张代码和前述的类似）：


    <figure class="half">
        <a href="{{ site.url }}/images/xxx.jpg"><img src="{{ site.url }}/images/ xxx.jpg"></a>
        <a href="{{ site.url }}/images/yyy.jpg"><img src="{{ site.url }}/images/ yyy.jpg"></a>
    </figure>
    
### 添加图片代码分享

因博客显示时引用的部分 HTML 代码有问题，所以另外发一份 md 版本的文档供参考。

下载地址：

百度云 - [Dl from BaiduYun](http://pan.baidu.com/s/1Bb4qM)  
box.com -  [Dl from Box.com](https://app.box.com/s/l8x1jajwv82umq33aa7dkwpl9sr59q55)  
dropbox -  [Dl from Dropbox](https://dl.dropboxusercontent.com/u/64524965/AddPic.md)  

愉快。


## Markdown 语法扩展阅读

* [献给写作者的 Markdown 新手指南 | 简书](http://www.jianshu.com/p/q81RER)
* [Markdown 语法说明 | WowUbuntu](http://wowubuntu.com/markdown/#editor)
* [Markdown语法说明（详解版） | 图灵社区](http://www.ituring.com.cn/article/504)

