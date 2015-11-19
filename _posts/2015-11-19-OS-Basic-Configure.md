---
layout: post  
title: Mac OS 基本环境配置命令集 
categories: [blog ]  
tags: [Tech, Mac, ]  
description: 「快速配置常用命令集」   
---

准确说该是配置的番外篇，虽说，嗯...正篇还没写 XD

重装系统的确是累活...不过好在还是有简化方案。命令模式开始用起来，补补墙角还是很不错的。

顺手将这次用到的命令集汇总一下



## Command Line Tool

XCode 选择安装

``` 
xcode-select --install
```

包含的可用命令集，可在 /Library/Developer/CommandLineTools/ 目录下查看。

## Install Ruby

关于 [Ruby](https://www.ruby-lang.org/en/downloads/)

Mac OS X 内置 Ruby，但并非最新版本。新版可下载安装文件安装。

```
brew install ruby
```

## Install git

Mac OS X 内置 git。

```
brew install git
```

## Install Homebrew

安装 [homebrew](http://brew.sh/)


```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

更新：`brew update`

## Install RubyGems

安装 [RubyGems](https://rubygems.org/pages/download)


```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
 
## Install Jekyll

安装 [Jekyll](http://jekyllrb.com/docs/installation/)

```
gem install jekyll
```

or the pre-release version:

```
gem install jekyll --pre
```

Mac OS X 最新版遇到故障可尝试以下方案：

```
sudo gem install -n /usr/local/bin jekyll
```

## NodeJS

安装 node 依赖：

```
brew install node
```

更新 node： `brew upgrade node`


## install zsh and others

安装 zsh：

```
brew install zsh
```
or

```
brew install zsh zsh-completions
```

安装 wget `brew install wget`

自动安装 oh my zsh:

```
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
```

安装插件 autojump `brew install autojump`



and so on 