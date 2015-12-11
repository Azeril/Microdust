---
layout: post
title: 个人版的文件命名规范
categories: [blog ]
tags: [Tech, ]
description: 良好习惯 估计也是从野蛮中培养出来的
---

长期的工作和生活过程中，我们往往会在个人设备中积累大量的素材资料，无论是自己撰写的、制作的，还是因为种种目的从网络中大海捞针搜寻并保存下来的。在一段时间后，如果希望能快速而准确地提取相关的内容，有一个良好的文件命名习惯就很有必要。



## 基本注意事项

* 不能使用的字符：「/」 这是指代根目录的符号或路径分隔符
* 最好不用特殊字符、转意字符（栗子）：
  * ？
  * *
  * @
  * #
  * &
  * \
  * \|
  * ;
  * <
  * \>

* 一般命名文件时，首字符避免用「+/-」、「.」（隐藏文件）及数字
* 注意文件大小写，Linux 系统对文件名大小写敏感
* 文件名中不使用空格，建议用下划线「_」代替

推荐字符：

  * a~z
  * A~Z
  * 0~9（非开头）
  * 下划线 _ 
  * 连字符 - 

## 命名规范

对文件添加能正确描述，便于未来快速提取到，以及避免很容易导致重名。

* 一般情况，避免使用拼音（人名地名一类除外）；
* 字符包含意义，且意义准确；
* 无意义时，用较短描述词；
* 不建议使用含有特殊意义的字符；
* 缩写字符，以准确明了为佳；
* 可扩容性，能兼顾内容增添而不紊乱；
* 简洁

## 标签化命名法

主要是针对文件。

多维度构成完整描述。由左到右，层级从大到小。

* name_name(_name)(number).filetype
* name_name_date.filetype

例子：

* github_desktop_gui.png
* chrome_extension_clearly.png
* dropbox_setting_network.jpg
* yvonne_reading_list3.md
* big_fish_meeting.md
* stardust_chapter_one.md

运用驼峰命名法，则是这样：

* GitHubDesktopGUI.png
* NoteStardust.md
* ChromeExtensionList.md
* JekyllBlogThemes.html
* LessonOutlineJekyll.md

### 图片文件运用

图片文件使用的几个注意点：

1. 日常使用，尽量限定格式：
  * png
  * jpg
  * gif
2. 最小原则。保证视觉效果前提下，选最小图片格式/质量：
  * 减少加载时间
  * 减少空间占用
  * 减少流量使用

## 参考资料

* [How to make clean URLs](http://www.desiquintans.com/cleanurls)
* [快乐的 Linux 命令行](http://billie66.github.io/TLCL/)
* [命名约定 — Google 开源项目风格指南](http://zh-google-styleguide.readthedocs.org/en/latest/google-cpp-styleguide/naming/)
* [iOS 切图文件命名规范 - 简书](http://www.jianshu.com/p/2896b2823b65)
* [Linux 命名规则](http://www.cppblog.com/fwxjj/archive/2009/06/01/86491.html)