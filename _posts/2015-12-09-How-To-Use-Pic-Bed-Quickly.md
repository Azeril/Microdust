---
layout: post  
title: Mac OS 图床运用优化模式 
categories: [blog ]  
tags: [Tech, Mac, ]  
description: 「不用很累很麻烦就可以生成自己的图片外链啊」   
---



在日常撰写博客及文档时，使用 Markdown 语法进行书写，涉及到图片的显示，往往需要借力于图床。但图片上传到生成可用外链的步骤往往显得繁琐。

以七牛为例，在 Mac OS 下如果用 GUI 界面来操作，那么需要这样的流程：

0. 写着写着，要配一张图片……
1. 在 Finder 确认图片位置
2. 打开浏览器
3. 通过网址或书签进入七牛云控制台
4. 选定某个七牛云空间
5. 点击「上传」选择具体目录下的图片，确认上传
6. 上传成功，在列表中选中该图片，复制外链
7. 忘了前面在写什么了...

如果是使用命令行工具，以 qrsync[1] 为例：

1. 写着写着，我又要配一张图片……
2. 把图片添加（无论是复制还是移动）到一个指定目录里，Finder 点几下
3. 打开 Terminal 或 iTerm
4. 输入一条同步的指令，提示上传完成（嗯，alias 把长命令自定义弄短点...）
5. 好然后，这里有三条路：
  - 记性好的话，在终端里输入七牛图片外链，独立域名+图片名称与后缀（输入得慢怪键盘...）
  - 聪明一点的话，用 TextExpander 或 aText 来简化输入流程；
  - 喔，如果记不得自己的七牛域名，那意味着还得去点开浏览器，然后...
6. 嗯...接下来写什么...

其实，不用很累很麻烦就可以获得自己的图片外链啊

一次拖拽，完成上传及图片外链自动生成。

1. 我要配图
2. Finder 找到图片，拖拽，（自动...上传，生成外链）
3. 切回编辑器，粘贴外链

![](http://dreamofbook.qiniudn.com/Blog.Dropzone.Pic.Add.Action.gif)

## 正餐开始

* 锅子：Dropzone ## 基础应用
* 主料：Qiniud.zbundle  ## 七牛的 Dropzone 插件
* 调味品：qiniu（ruby gem）& Python ## 命令工具依赖

### 应用安装

Dropzone 是……

> Dropzone is a productivity tool for the Mac that makes it faster and easier to move and copy files, launch applications, upload to many different services, and more.

嗯哼。实际功能自然远不止于让我们能快速上传相片这样一个。但简单粗暴的实质在各方面运用中都是类似的...

正版的购买途径有 App Store 和应用开发者官方。其中，在 App Store 购买的版本受限于 Apple 的沙盒，功能不全。但可以从官方下载完整版覆盖安装。

官方声明：[Aptonic - Dropzone 3 Sandboxing](https://aptonic.com/dropzone3/sandboxing.php)

* 开发者官网：[Aptonic - Dropzone 3](https://aptonic.com/)  
* AppStore：[Dropzone](https://itunes.apple.com/us/app/dropzone-3/id695406827?mt=12)


### 环境部署

进入终端进行安装：

* Python（Mac 自带）
* qiniu（依赖 ruby/rubygems 工具，Mac 自带），命令如下：

```
sudo gem install qiniu
```

如果报错，频繁出现的幺蛾子是：

```
ERROR:  While executing gem ... (Errno::EPERM)
    Operation not permitted - /usr/bin/restclient
```

请看此 Issue：[Sass won't install on El Capitan · Issue #1769 · sass/sass](https://github.com/sass/sass/issues/1769)。注意将 

```sudo gem install -n /usr/local/bin GEM_NAME_HERE``` 

命令中的 `GEM_NAME_HERE` 替换为 `qiniu`

如果不是，自己动手丰衣足食啦。


### 插件安装

做菜总得有料...接下来就是为 Dropzone 配置七牛云插件。Qiniud.zbundle。

下载地址：[Aptonic/dropzone3-actions](https://github.com/aptonic/dropzone3-actions) 把整个仓库扒下来，找到主目录下的 Qiniu.dzbundle 插件。

或者 <http://t.cn/R47IsVs> 直接下载

安装很容易，双击一下，在新出现的对话框，点击「Add to Grid」完成。

## 配置

![](http://dreamofbook.qiniudn.com/Blog.Dropzone.GUI.png)

接下来是配置。选中七牛插件，右键选择「edit」。

![](http://dreamofbook.qiniudn.com/Blog.Dropzone.QNSetting.png)

|选项|填写的对应内容|
|---|---|
|Server|个人七牛空间名|
|Username|AccessKey|
|Password|SecretKey|
|Remote Path|选填。同步于本地的图片目录|
|Root Url|个人七牛空间独立域名|

Remote Path 用于将随时在各个目录下拖拽上传的文件备份在本地目录一个选定文件夹中。填写该选项测试时总报错，不知具体的路径逻辑是怎么样的，不过可以忽略。


## 参考文档

* [qrsync 命令行同步工具](http://docs.qiniu.com/tools/v6/qrsync.html)  七牛官方 Qrsync 命令行工具同步教程
* [使用 Dropzone 和七牛云存储来优化博客图床](http://yansu.org/2015/01/10/use-dropzone-and-qiniu-to-store-blog-images.html) 插件作者博客说明
* [Aptonic - Dropzone 3](https://aptonic.com/) Dropzone 官方网站
* [Aptonic/Dropzone3-Actions](https://github.com/aptonic/dropzone3-actions) Dropzone Actions  GitHub 插件集