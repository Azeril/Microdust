---
layout: post
title: 修复 Jekyll 升级 3.0 版后的预览问题
categories: [blog ]
tags: [Tech, ]
description: 一次手贱更新版本带来的后续问题及解决...
---

前天深夜手贱 update 了 rubygems，还一并更新了 gems 的所有安装包，与时俱进麽。结果，昨天想用 Jekyll 博客本地预览服务时发现 Jekyll 升级到了 3.0.1 版本，自动生成本地博客的服务很果断地出问题了...


运行 ```$ jekyll serve``` 出现报错：

最开始遇到的提示是：

> Deprecation: You appear to have pagination turned on, but you haven't included the `jekyll-paginate` gem. Ensure you have `gems: [jekyll-paginate]` in your configuration file.

## Install Jekyll-paginate

安装 Jekyll-paginate 插件：

```
$ sudo gem install jekyll-paginate
```

确认是否已经包含在已安装的 gem 插件列表中：

```
$ gem list
```

然后，将 `gems: [jekyll-paginate]` 这一段设定添加到自己博客仓库主目录下的博客设置文件 _config.yml 中。

## Install pygments.rb

而后安装 pygments.rb 依赖到系统中。

```
$ gem install pygments.rb
```

添加 pygments.rb 到现有的 gemfile 中：

```
gem 'pygments.rb'
```

嗯...这个文件就算解决了。但是！升级这么折腾的事岂会让我这么轻松愉快就跑起 Jekyll 博客来呢……

再次运行 ```$ jekyll serve``` 遇到一个新的问题：

> Since v3.0, permalinks for pages in subfolders must be relative to the site source directory, not the parent directory. Check http://jekyllrb.com/docs/upgrading/ for more info.

解决方案：

删除 _config.yml 文件下的 `relative_permalinks: true` 一项。  

再次运行服务，恢复正常啦。

![](http://dreamofbook.qiniudn.com/Blog.Jekyll.Run.The.Serve.png)


## 参考资料
* [Upgrading from 2.x to 3.x](http://jekyllrb.com/docs/upgrading/2-to-3/)
* [Compability with Jekyll 3? · Issue #99 · poole/poole](https://github.com/poole/poole/issues/99)
* [Jekyll serve didnt work - Stack Overflow](http://stackoverflow.com/questions/33439019/jekyll-serve-didnt-work)