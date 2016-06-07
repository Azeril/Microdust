---
layout: post
title: Zsh & oh-my-zsh 终端漫游的利器
categories: [blog ]
tags: [Mac, ]
description: 打造一个得心应手的终端工具
---


## Intro 简介

<figure>
    <img src="http://dreamofbook.qiniudn.com/ZshLogoDisplay.png">
</figure> 


Zsh 是一个 Unix shell，是 Z shell 的简称。Zsh 作为一款强大的终端工具，能帮助你更高效地编写和执行命令。

主要特性与特性：

- Zsh 兼容 bash（Bourne shell），没有什么迁移的学习成本
- 更全面的自动补全功能（命令、选项、参数、目录、文件等）
- 更高效的补全模式。输入命令/路径/文件名等的一部分，点击一下 Tab 键触发自动补全。当补全选项有多个，则会在终端中列表显示，可通过键盘方向键或 Tab 键的移动供来选择
- 自定义提示符，并集成 Git 的提示，当进入目录为 Git 仓库时，会提示 Branch 信息（git 插件提供的功能）
- 支持全局与后缀名的 alias，让 alias 短命令能搭配参数使用，比如 `gst` 用于替换 `git status` 的输入，`gp` 执行 `git push` 等。
- 快速目录切换，省略 `cd` 命令，直接输目录名称即可进入
- 多终端会话共享历史记录
- 更实用的历史记录功能，支持历史命令行的受限搜索，输入 `py`，点击上方向键，即可查阅之前执行的 Python 命令
- 通配符搜索
  - 不通过 `grep` 命令，利用 `ls` 命令即可在终端中完成搜索，`ls *.jpg` 就能当前目录下所有 jpg 图片文件都搜索出来；
  - 也可以使用递归查找:`ls **/*.mobi` 将这个目录中所有相匹配的 mobi 电子书文件挖掘出来。
- 搭载丰富的主题包（依靠 oh-my-zsh）

<figure>
    <img src="http://dreamofbook.qiniudn.com/OhMyZshLogoDisplay.png">
</figure> 


Zsh 好用也足够强大，但它的配置相对复杂，这时，有一个叫 oh-my-zsh 的 Zsh 扩展工具，源自 GitHub 的一个个人开源项目，它内置丰富的自定义主题（指 Zsh 显示风格），自带上百个功能各异的插件，并能便捷地管理和配置。让使用者能快速上手 Zsh。


Zsh 与 oh-my-zsh 具体的安装方式与配置方法，不同平台略有差别，本文仅以 Mac OSX 平台为例。

## Install 安装

查看当前系统的 Shell：

```
$ echo $SHELL
```
默认情况下是 `bash`。查看当前系统默认 Shells 的命令：

> cat /etc/shell

安装 Zsh：

OSX 自带 Zsh，但不是新版，可以使用 Homebrew 进行更新安装：

```
$ brew install zsh
```

配置、切换

切换当前用户的 Shell 为 Zsh：

```
$ chsh -s /bin/zsh
```

执行切换命令后，另开 Terminal 窗口，会发现 Zsh 已完成对终端的接管。

提示：如果原先在 `.bash_profile` 配置过 alias 短命令或设定，可以转存到 `.zshrc` 文档中。因为 Zsh 兼容 bash，使用上不会有问题。这一步骤可以放在安装和配置完 oh-my-zsh 之后，以免重复操作。

## Config 设定

在进行具体的配置之前，需先完成 oh-my-zsh 的安装。官方推荐使用 `curl` 或 `wget` 下载程序进行下载。如果没有安装，可先通过 `Homebrew` 安装任意一款，然后依照对应的方式下载。

使用 `curl` 安装：

```
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

使用 `wget` 安装：

```
$ sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```

此外，也可通过 Git 安装 oh-my-zsh：

```
$ git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
```

配置：

备份当前存在的 Zsh 配置文档：

```
$ cp ~/.zshrc ~/.zshrc.orig
```

通过 oh-my-zsh 配置模板来创建配置文件：

```
$ cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
```
更换主题：

主题皮肤的存放路径是 `~/.oh-my-zsh/themes`。

想查看主题所对应的显示效果（有截图），可到官方 Wiki 中的主题展示： [Themes /oh-my-zsh Wiki](https://github.com/robbyrussell/oh-my-zsh/wiki/themes)。喂不饱你？还有更多扩展主题：[External themes /oh-my-zsh Wiki](https://github.com/robbyrussell/oh-my-zsh/wiki/External-themes)


```
$ vi ~/.zshrc
```

使用 Vim 打开配置文件更换。将 `ZSH_THEME="Themes"` 一项引号部分修改为自己想要使用的主题皮肤。(个人推荐 `robbyrussell` 主题)当然，如果希望尝试新主题，你也可以将皮肤主题设置为随机使用。只要将主题选项参数设为「random」即可。

![](http://dreamofbook.qiniudn.com/CLIiTermAndArcheyDisplay.png)

```
$ ZSH_THEME=”random”
```

执行命令，使配置生效：

```
$ source ~/.zshrc
```

以后每次开启新的终端窗口都会随机加载一款主题了。

## Plugins 插件集

oh-my-zsh 提供丰富的插件，除了 Git 这个默认开启的插件，多数插件是默认存在，但没被启用的。需要自己去设定中添加。

自带插件的本地存放目录：`~/.oh-my-zsh/plugins/`。如果你想了解插件的功能和使用方法，阅读对应插件目录下的 *.plugin.zsh 就行，比如查看 Git 帮助文档，就直接 vi ~/.oh-my-zsh/plugins/git/git.plugin.zsh。

插件集概览的网页版：[Plugins Overview /oh-my-zsh Wiki](https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins-Overview)

添加插件的方法，在 `.zshrc` 中进行设置。找到 `plugins` 选项（可搜索定位），完成相应插件名（注意大小写）的添加：

```
plugins=(git osx rake ruby)
```

使配置生效：

```
$ source ~/.zshrc
```

插件推荐：

- git 
  + 启用 git 命令的缩写
- osx
  + `$ cdf` 在终端中直接跳转当前 Finder 所在的目录；
  + `$ quick-look file_name` // 快速预览；
  + `$ man-preview command_name` // 在 preview 中打开命令指南的 pdf 版；
  + itunes: 命令行操作 iTunes。
- autojump 
  + 智能跳转，可快速跳转到曾进入的目录
  + 使用 `$ j path_name`，路径名只要输入前缀，然后 Tab 补全即可。
- sublime
  + 添加对编辑器 Sublime Text 的支持
  + `$ st file_name`，在终端执行后，可用 Sublime Text 打开对应的文件
  + 如果想省掉输入 st，可以直接设定 alias。`alias -s c=st h=st # 在命令行直接输入后缀为 c 的文件名，会在 sublime 中打开
- 

## 参考
* [Z shell - Wikipedia](https://en.wikipedia.org/wiki/Z_shell)
* [Zsh.org](http://www.zsh.org/)
* [robbyrussell/Oh-My-zsh - GitHub](https://github.com/robbyrussell/oh-my-zsh)
* [Themes · robbyrussell/oh-my-zsh Wiki](https://github.com/robbyrussell/oh-my-zsh/wiki/themes)
* [使用 Zsh 的九个理由](http://blog.jobbole.com/28829/)
* [Zsh Workshop: Why Zsh](https://www-s.acm.illinois.edu/workshops/zsh/why.html)
* [Zsh 使用指南(译)](http://hackerxu.com/2014/11/19/ZSH.html)
* [关于 Zsh，我最喜欢的那些特性](http://blog.jobbole.com/80620/)
* [Mac OS 基本环境配置命令集 - Microdust](http://azeril.me/blog/OS-Basic-Configure.html)  
* [wting/autojump - GitHub](https://github.com/wting/autojump)

