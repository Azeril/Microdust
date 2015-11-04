---
layout: post
title: C++ buiding error list
categories: [blog ]
tags: [C++, ]
description: 对碰到的C++问题的汇总
---
#LINK : fatal error LNK1123: 转换到 COFF 期间失败: 文件无效或损坏

##问题说明：
当安装VS2012之后，原来的.NET 4.0会被替换为.NET 4.5。卸载VS2012时，不会恢复.NET 4.0。当VS2012安装后，VS2010的cvtres.exe就无法使用了。如果你的PATH环境变量中VS2010的工具路径第一个出现，而且链接器需要将.res文件转换为COFF 对象格式，就会导致LNK1123错误。
当VS生成PE文件头时，使用的cvtres.exe版本错误，不能与当前的.NET平台兼容。
##解决方案：
[link-fatal-error](http://stackoverflow.com/questions/10888391/link-fatal-error-lnk1123-failure-during-conversion-to-coff-file-invalid-or-c)
因为是cvtres.exe版本错误导致的结果，所以凡是能使VS链接器找到正确的cvtres.exe版本的方法都可以解决该问题。或者使VS链接器不生成COFF的方法都可以。
### 方案一
当前系统中存在两个cvtres.exe文件，版本不同。让VS2010使用.NET 4.5的cvtres.exe程序。
>重命名或删除：（vs2010安装的位置）C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\bin\cvtres.exe
>这样C:\Windows\Microsoft.NET\Framework\v4.0.30319 (.NET 4.5)中的cvtres.exe文件就可以被VS2010使用。

### 方案二
>项目\属性\配置属性\清单工具\输入和输出\嵌入清单：原来是“是”，改成“否”。
>说明：这种方法每个工程均需要修改配置。

###方案三
>安装：VS2010 SP1. 该版本应该是能使用.NET 4.5的，并配有正确的cvtres.exe版本。
>注意：安装VS 2010 SP1 时会移除64-bit 编译器. 通过安装 VS 2010 SP1 compiler pack 能够重新获得。
 