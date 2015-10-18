---
layout: post  
title: 打造你的第一个 GitHub Pages 个人博客（小白教程）  
categories: [blog ]  
tags: [Tech, ]  
description: 「标准是好用且好看 」   
---

## About GitHub Pages

* 编辑器与工具本地化，用合心意的应用软件书写和改造 blog；
* 无需另行搭建服务器或购买空间，基于 GitHub 仓库搭建（有空间限制 300M 但够用）； 
* 配置简单；
* 有丰富的博客主题可以尽情挑选；
* 可绑定个人独立域名；
* Markdown 标记语言书写；
* 可本地和在线发布博文；
* Git 对博客内容的版本控制；

## About Jekyll

Jekyll是一个静态网站生成器，用ruby编写而成，结合了markdown、Liquid等技术，简化了静态网站的构建过程，配合disqus等技术，可以方便的生成具有简单动态功能的网站。

当然你还可以运用一些预置的主题，做一些自定义的配置，以及自己定义主题增加模板配置文件、增加Blog挂件、加入Google Analytics、Disqus等等，同样可以将一个静态网站做的栩栩如生。



## Build Your Blog

### Register GitHub 

注册 [GitHub](https://github.com/) 并设置个人 ID，在个人的注册邮箱里确认注册，完成登陆。

### Create A Repo

力求快速建站，还是奉行「拿来主义」的策略。在找到合意的 GitHub Pages(这里主要是基于 Jekyll ) 博客主题后，Fork 这个博客主题的 GitHub 仓库。

当然，对于已经下载的博客主题 git 压缩包，可以在网页版主页右上角（ID 头像边），点击「+」，Create New Repository，并通过客户端版将解压的仓库文件上传到该 Repo。或客户端版「Create」选项，创建新仓库并选择该将仓库文件 publish 到 GitHub。

这里有一个注意点，无论是 Fork 还是 Create，必须要将这个打算作为博客的 Repo 的标题，命名或改名为 yourname.github.io 的形式，yourname 是指你的 GitHub Name，此处命名形式 yourname 必须与你的用户名一致。gh Pages 博客才能生效（ Repo 首次生效需要等待几分钟，生效后就可以访问该博客啦。完成后以后添加或改动的更新都会蛮快同步）。

* Fork a repo;
* Change the repo title to 「yourname.github.io」;
* Waiting for the setting take effect a few nimutes later;
* You can interview the blog from 「yourname.github.io」 on your browser;

## Jekyll Blog Configuration

我们 Fork 的只是别人创造的主题，或者单纯的模板，哪怕生效后访问也没有一点自己的痕迹，那怎么算个人博客呢！接下来就是对博客个性化的过程。

### Jekyll Blog Files Overview

磨刀不误砍柴工。先说明 Jekyll 博客的一般文档类型。

一个典型博客的基础目录结构：

    |-- _config.yml
    |-- index.html
    |-- _includes
    |-- _layouts
    |   |-- default.html
    |   `-- post.html
    |-- css
    |-- js
    |-- _posts
    |   `-- 2015-04-27-Like-Kissing.md
    |-- images
    |   `-- Leah.png 
    |-- CNAME
    |-- _404.html
    |-- About.md
    |—— feed.xml
    `-- README.md

目录文档详细说明：    

* _config.yml **博客配置**文档（包括博客标题、favicon、博主 ID、头像、描述、联系方式等基本信息都在这个文档添加或修改）；
* index.html 博客架构文档；
* _includes 博客调用的网页模块（比如导航栏、底栏、博文内容显示、评论模块等），一般不需要管；
* _layouts 存放博客调用的页面模板文件（比如博客主页、具体博文页）的文件夹；
* css 存放博客系统的页面渲染文档文件夹，主要用于调节诸如标题字体、博文字体大小颜色之类；
* js 存放博客调用的 JS 文档文件夹
* _posts **博客正文**存放的文件夹。命名有规定，必须为「日期 + 标题」的模式，即「2015-04-27-Like-Kissing.md」，才能发布到博客里；
* images 图片文件夹，存放博客相关素材，包括博客 favicon、博主头像等图片及博文贴图素材；
* CNAME 用于绑定个人域名的文档；
* 404.html 「404 Not Found.」站点链接无法访问时的展示页。
* About.md 博客中的个人说明文档（About Me）；
* feed.xml 博客的 RSS 订阅工具；
* README.md 项目说明文档。用于 Github 个人项目主页的说明（描述）。

## Custom Configuration

自定义修改中，需要自己修改的文档包括：

* _config.yml
* About.me、CNAME
* images 文件夹下的存放的 favicon、头像一类。


### Install Git 
GitHub for Desktop [Windows/Mac](https://desktop.github.com/)  GitHub 的客户端版（区别于命令行工具）。

安装完成后登陆个人账户。

### Install TextMate or Sublime Text

工欲善其事，必先利其器。介绍

## Domain Purchase & Configuration

什么，你还想要为 blog 挑一个更有 feeling 的域名？

GitHub Pages 博客默认关联的是以 yourname.github.io 为格式的网址。如果已拥有自己的个人域名，可以直接在博客的 Repo 主目录里新增一个 CNAME 文件，内容为个人域名。比如，本博客添加的域名记录条目就是「azeril.me」。

什么？还没有，又想要？请继续往下读。

### Domain

几个比较好的域名服务商：

* [GoDaddy](https://www.godaddy.com/) The World's Largest Domain Name Registrar  
* [Namecheap.com](https://www.namecheap.com/) Cheap Domain Name Registration & Web Hosting  
* [Gandi.net](http://www.gandi.net/) 域名注册商与 VPS Cloud Hosting

说明：首先声明，好是相对的，各有各的优点，也各有各的问题。

**GoDaddy** 江湖人称「狗爹」，是世界上最大的域名服务商。经常有优惠码（Google 搜索下一大堆），首年购买价格还是有不少折扣的。另一个巨大优势是：支持支付宝。

**Namecheap** 价格便宜，且不需要用什么花哨折腾的优惠码之类的（说谁呢），价格本身就低，不过不支持支付宝与银联。海量域名可选，包括很多**冷门**的域名，这方面很多中国用户有福利。例子如：

* andy.lv （吕 实际对应拉脱维亚
* lily.li （李 实际对应列支敦士登
* jack.hu （胡 实际对应匈牙利
* killy.lu （陆 实际对应卢森堡

此外还有城市（Rome/Tokyo/Paris/Taipei 等）以及人物类（hr/fans/lawyer 等）或 coffee/blue/tv 等等...

**Gandi.net** 特定时间特定域名有优惠，信息发布很及时。界面很友好。海量域名，五百多个...这方面与 Namecheap 互有优势。上次在这里买过一个 .cat 结尾的。支持银联，但结算很慢（不知现在是否有改善）。如果有 Visa 一类就尽量不用银联转款啦。 

### DNS Support

[DNSPod](https://www.dnspod.cn/) 是中国的 DNS 解析服务商。因为众所周知的原因，国内服务商还是有天然优势……在站点解析方面速度和稳定性都不赖，让 DNSPode 成为首选。因而在购置域名后一般会单独操作，将原有的由各家域名服务商提供的域名解析修改为 DNSPod 提供的服务。

DNSPod 的帮助说明里对于常见域名服务商，如 GoDaddy/NameCheap/ 以及国内的几家服务商都有专门的配置说明。类似 Gandi.net 等不在列的，根据相关的说明和官网指南也不难添加。基本步骤如下：

* 添加域名到 DNSPod；
* 在 DNSPod 新增域名下添加 A 记录，Github Pages IP Address：「192.30.252.153」；
* 在域名服务商站点修改 DNS 服务。添加 DNSPod 的两个地址；
* 域名解析完成；
 
具体请查看：[学会使用DNSPod，仅需三步-DNSPod-DNSPod](https://support.dnspod.cn/Kb/showarticle/tsid/177/)

域名添加完成后，需等待解析生效。时间是 0~72 小时，一般一天内都能完成。

## GitHub Setting