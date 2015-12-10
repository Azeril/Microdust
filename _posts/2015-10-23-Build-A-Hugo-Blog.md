---
layout: post
title: 搭建一个 Hugo Blog
categories: [blog ]
tags: [Mac, Tech, ]
description: 玩玩...  
---




## Install Hugo

系统环境：Mac OS 

Install Ruby

Mac OS 安装 XCode 则集成了 Ruby。如果没有集成，可以到官网下载安装版。[Ruby Programming Language](https://www.ruby-lang.org/en/)

Install [Homebrew](http://brew.sh/index.html)

> $ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

Install Hogo：

> $ brew install Hugo



### Other System and Install 


安装完成后，执行检验：

> $ hugo version

## Create A Hugo Blog

> $ hugo new site site_name

执行后，将在对应路径中生成一个以 site_name 为名，存放博客模板初始化完成的文件夹。

目录结构为：

    |- config.toml
    |- archetypes
    |- data
    |- content
    |— layouts
    `- static
			
			
* config.toml 配置网站信息
* archetypes 
* content 博文内容
* layout 模板
* static 调用的模块，CSS、JS 及字体一类。

## Themes

> $ git clone --recursive https://github.com/spf13/hugoThemes themes

Hugo 官方提供的主题包。自动下载在 themes 文件夹中。

不得不吐槽的是，虽然模板的数量很大，占用 400M 左右的空间。当然，大多数也不怎么样...选合适的用就行。

## More

创建

> $ hugo new document.md

在 `content` 文件夹里会新增一个 markdown 文件。


预览

> $ hugo server -w

浏览器 localhost:1313 查看



## 参考资料

* [Installing Hugo](https://gohugo.io/overview/installing/)
* [利用Hugo搭建博客系统 - 苦X工程师](http://kevensya.github.io/post/hugo-install/)