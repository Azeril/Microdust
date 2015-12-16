---
layout: post
title: Markdown 简明语法参考
categories: [blog ]
tags: [Mac, ]
description: 这是一份基本版的 Markdown 语法清单
---

## Markdown 概述

Markdown 是一种轻量级标记语言，它允许人们使用易读易写的纯文本格式编写文档，然后转换成格式丰富的HTML页面。 
—— [维基百科](https://zh.wikipedia.org/wiki/Markdown)

Markdown 语法是对纯文本格式的强化，能使文本显示得更清晰、有条理。但它依旧算是简单的文本，很容易修改和扩展，常用于快速写作中。

所见即所得。不少 MD 编辑器有极强的实时预览渲染，可以让写作者及时看到自己写作的内容显示效果并对此做出调整。

Markdown 格式的简洁特性、兼容扩展性颇佳，使之能快速转换为各种互联网上的常用格式，比如 HTML、Word、PDF 等。目前，越来越多的人开始接受和使用它。

## Markdown 编辑器

常见及常用的 Markdown 编辑器很多，比如：

* [MacDown](http://macdown.uranusjr.com/)
* [Typora](http://typora.io/)  

此外还有（收费为主）：

* [Scrivener](http://www.literatureandlatte.com/scrivener.php)
* [Typed](http://realmacsoftware.com/typed/)
* [
](https://ia.net/writer/mac/)
* [Byword](http://bywordapp.com/)
* [Marked 2](http://marked2app.com/)
* [Ulysses](http://www.ulyssesapp.com/)
* [Marboo](http://marboo.io/) 
* [Mou](http://25.io/mou/)

以及支持 Markdown 的优质在线编辑器：

* [马克飞象](http://maxiang.info/)
* [Dillinger](http://dillinger.io/)
* [StackEdit](https://stackedit.io/)
* [Markable](http://markable.in/editor/)

入门编辑器推荐第一序列的 MacDown，其它编辑器可以等熟悉 Markdown 之后再自行探索。
 


# Markdown 语法

关于 Markdown 的基本语法，这里将逐一说明。对于一些写作中一般不算常用（不好用）的表格及代码展示，不多说明。

基本所有以下涉及的标点都以在英文输入状态下的为准。不然会导致语法失效。

先看一个包含了蛮多基本语法的范例。

![Markdown](http://dreamofbook.qiniudn.com/Markdown-Sample.png)

关于语法，让我们先从在文中起到分清区块、梳理逻辑关系的标题说起：

## 标题

    # 一级标题
    ## 二级标题
    ### 三级标题
    #### 四级标题
    ##### 五级标题

显示效果如下：

# 这是一级标题  
## 俺，二级标题  
### 我是三级标题  
#### 人家只是个四级标题……  
##### 更小的我，五级标题 XD 
###### Github 支持的最小的可以我（哪里冒出来的）
*** 

## 换行

Markdown 语法下，换行的方式有：

1. 隔行换行。连续敲击两下「Return」键，再开始写下一段；
2. 在行末添加两个空格符，而后「Return」（为了显示清晰），开始写下一段。

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
    ___ 其实，还可以这样
    
以下就是一条分割线：

***

## 列表

列表分无序列表合有序列表两类，前者以「*」、「-」、「+」开头，后者以阿拉伯数字「1」开头。

三个注意点：

1. 如果前面有内容，在输入字符前，应先空一行；
2. 符号与内容之间，须隔一个空格符，列表模式才能生效；
3. 第一行内容输入完成，换行会自动补全下一行的开头符号（有序列表数字递增，无序列表符号不变），接下去只需继续输下一行内容，以此类推；
4. 多层级列表，为美观也为减少出错考虑，注意同级列表符号的统一和上下对齐。

无序列表：

    Unordered List:
    
    * English
    * Japanese
    * Chinese
    * ……

    Unordered List:
    
    - English
    - Japanese
    - Chinese
    - ……

显示效果均如下：

Country List：

* English
* Japanese
* Chinese
* ……


有序列表：

    Ordered List:
    
    1. Orange
    2. Apple
    3. Banana

My Favorite Fruit List:
    
1. Orange
2. Apple
3. Banana

多层级列表：

    两都名胜
    
    - 南京
      + 玄武湖
      + 中山陵
      + 鸡鸣寺
    - 杭州
      + 西湖
        * 苏堤
        * 湖心亭
        * 太子湾
      + 九溪
      + 灵隐

注：此处的几个符号作用都是一样的，不同层级符号有所区别只为显示美观。日常使用，请每一级的符号一致。

显示效果如下：
      
两都名胜
    
- 南京
    + 玄武湖
    + 中山陵
    + 鸡鸣寺
- 杭州
    + 西湖
      * 苏堤
      * 湖心亭
      * 太子湾
    + 九溪
    + 灵隐

*** 

## 引用

引用。使用「>」，添加在每行的开头。

两个注意点：

1. 「>」的上一行，必须为空行；
2. 「>」与其后紧跟的第一个字之间有无空格符不影响效果（不过建议加一个）。

显示效果如下：

詹姆斯·馬奇《馬奇論管理》：

> 堂吉诃德提醒我们，如果我們只在不被辜負時去信任，只在有所回報時去愛，只在學有所用時去學習，那麼我們就放棄了為人的特征——願意在自我理念的名義下行動，不管結果如何。

或者，你想要引用一首诗、一首歌：

    > 五月天《天使》
    
    > 像孩子依赖着肩膀 
    > 像眼泪依赖着脸庞 
    > 你就像天使一样 
    > 给我依赖 给我力量  

这儿也需要注意换行：每一行最后换行，添加两个空格符，不然内容会挤压在一块，变成一行。或者行与行之间，空一行。以下例子中，歌词部分输入时虽然都分列开，而实际显示时歌词都连成一句了。

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

如果是想嵌套引用，像这样：

> 浙江  
>> 杭州  
>>> 西湖  
>>>> 湖心亭  

博客默认的 Markdown 工具有点问题，效果如下图：

![嵌套引用](http://i1381.photobucket.com/albums/ah234/Azeril_Lapland/Screen%20Shot%202015-08-30%20at%209.26.17%20PM_zpsg0ojze8c.png)

语法如下，每行多添加一个「>」符号，再输入文字内容即可（每行行尾记得添两个空格符）：

    > 浙江
    >> 杭州
    >>> 西湖
    >>>> 湖心亭


## 代码区

也就是 Blockquotes。

如果行尾不空格呢有没其它解决方法呢？如果是这样——
 
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

这里的方法是首行开头缩进四个空格符，或敲一下 tab 键（制表符键）。

还有一个方法。连续三个反引号「`」组成的前后两行，将内容包裹起来。


显示效果如下：

```
这是另一个代码区块
```

在代码区块中，Markdown 语法不会被转换，这也是为什么前面很多 Markdown 语法的例子能在代码区展示出来的缘故。不然这样一篇以 Markdown 语法解释 Markdown 语法的说明也无从谈起了。

嗯...嗯？

反引号的输入：英文输入模式下，点击键盘左上角的「~」键。


## 标记

标记小段代码（文字）。为着重强调的内容添加深色背景框，在内容前后各添一个反引号「`」，将代码段或文字夹在中间即可实现。

显示效果如下：

1. Use the `printf()` function.
2. 这是加深背景色框的`字符`。

*** 

## 网址链接

### 自动链接

使用「<」、「>」这样的尖角符号，url/email 在 Markdown 下可自动实现可点击链接的效果。

    <http://www.google.com>

显示效果如下：

<http://www.google.com>

### 网址链接

至于网址链接的基本格式，应该是这样：

    [Link Name](Link) 

构成为：

* 一个方括号，添加图片的描述文字
* 一个括号，添加图片网址

以下为一个网址的栗子：

    [Welcome to my blog](http://azeril.me)

显示效果如下：

[Welcome to my blog](http://azeril.me)

### 索引链接

内容描述后添加定义链接（以数字/英文/符号为主），在文字段落外关联具体网址，实现可跳转效果。

    [Click Google Search][Tags]

    [Tags]: http://www.google.com "Google"

显示效果如下：

[Click Google Search][Tags]

[Tags]: http://www.google.com "Google"

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

## 添加表格

	|Title |Title 1|Title 2|Title 3|
	|---|---:|:---:|---:|
	| A|B|C|D|

显示效果如下：

|Province | ZJ 浙江省 | FJ 福建省 | YN 云南省 |
|---|:-----|:-----:|-----:|
|省会|杭州|厦门|昆明|

一般的表格由「|」与「-」两种符号（英文半角字符）构成。第一、三及其后的行都由「|」组成。依数据的列数确定数量（列数据量 +1）。  
第二行为中间为连续的「-」组成的隔断，数量不限，更多是让文本显得美观（和预览无关）。

第二行中出现的冒号作用是设定表格内数据的对齐方式，不是必须使用的。具体意义如下：

1. :-- 冒号在左，左对齐
2. --： 冒号在右，右对齐
3. ：--： 左右两侧都出现冒号，居中对齐

## 转义符

如何在 MD 文档中输出被用于转换格式的符号本身？这里就需要转义符，也就是反斜线「\」来协助。

如果要显示「*」，则可以用如下的方式：

	表示强调的符号这样用： \*Emphasize\*

显示效果如下：

表示强调的符号这样用： \*Emphasize\*

支持转义的 MD 符号包括：

    \   反斜线
    `   反引号
    \*   星号
    \_   下划线
    {}  花括号
    []  方括号
    ()  圆括号
    #   井号
    +   加号
    -   减号（连字符）
    .   句点
    !   感叹号

*** 
## 扩展阅读

基于 Markdown 的 HTML 语言运用。

HTML 可以契合 MD 语法，而通过利用前者，可以实现一些单纯依靠 MD 语法暂时无法实现的功能和页面显示效果。

### 网址链接

页面内跳转链接。利用 HTML <img> 语法制作 Markdown 长文的可跳转目录。分两部分，前为具体条目信息，后边则指向内容的位置（代码段放在页面的哪里，点击索引条目后就跳转到哪里）。

范例语法如下：

    [Line](#A)

	<a name="A"></a>

[Line](#A)

<a name="A"></a>

## 添加图片(进阶版)



![Pic_Sample](http://7s1rzi.com1.z0.glb.clouddn.com/Pic_Sample.jpg)

在页面中，要并排插入多张图片（两张或三张并排显示）或将插入图片居中显示，又或者是类似固定显示图片的宽度与高度，目前依靠 Markdown 语法还无法实现。
这时，调用 HTML 语法就可以轻松搞定。

以下，可以仅看添加图床图片的那部分，减少认知负荷。

### 图片与图床

图床是第三方服务托管个人上传图片，并提供图片外链，让我们在写博客文章时使用的方式。

常用图床： 

* [七牛云存储](http://www.qiniu.com/)
* [Imgur](http://imgur.com/)
* [Photobucket](http://s1381.photobucket.com/)

图床在上传图片后会提供一个图片的外链。我们可以利用外链把图片添加到自己的博文中。图片也可以存储在 Github 自己的博客项目里，不过图片蛮占用空间（Github 项目空间为200 M）。因而最好是选图床托管图片。

如果是单纯插入来自图床的图片外链：

单张居中显示：

    <center>
        <img src="http://dreamofbook.qiniudn.com/Zero.png">
    </center>
    
    OR

    <figure>
        <img src="http://xxx.jpg">
    </figure> 

效果如下：

<figure>
<img src="http://dreamofbook.qiniudn.com/Zero.png">
</figure> 

固定图片宽度/高度：

    <img src="http://xxx.jpg" title="Logo" width="100" />

宽度是 Width，高度是 High。Title 为图片描述。

效果如下：

<img src="http://dreamofbook.qiniudn.com/Zero.png" title="Logo" width="100" />

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

![code](http://dreamofbook.qiniudn.com/onelinecode.png)

使用时复制和修改相应的代码，并替换「/images/xxx.jpg」这样的链接为自己放置图片的路径。

如果 Github 项目下有 images 文件夹，直接在里面放图，就是如上的代码替换。如果是 images 目录下的文件夹，如 Instagram，则路径为：「images/Instagram/ xxx.jpg」。依此类推。

![](http://dreamofbook.qiniudn.com/twolinescode.png)

### 附加浏览窗口的模式

更复杂一点，点击图片可以跳出一个预览窗口，可以看大图和切换图片。

效果如下：

![PreviewPic](http://dreamofbook.qiniudn.com/Preview_Pic.png)

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


## 参考文档及扩展阅读

1. [献给写作者的 Markdown 新手指南_简书](http://www.jianshu.com/p/q81RER)  
2. [Markdown 语法说明_WowUbuntu](http://wowubuntu.com/markdown/#editor)  
3. [Markdown 语法说明（详解版）_图灵社区](http://www.ituring.com.cn/article/504)  
4. [Mastering Markdown · GitHub Guides](https://guides.github.com/features/mastering-markdown/)
5. [Markdown - Wikiwand](https://www.wikiwand.com/zh/Markdown)
6. [Markdown 写作浅谈 - 阳志平的网志](http://www.yangzhiping.com/tech/r-markdown-knitr.html)
