---  
layout: post  
title: Django 模板   
categories: [blog ]  
tags: [Django,  ]
description: 「Django 模板」  
--- 

在前面的几节中我们都是用简单的 `django.http.HttpResponse` 来把内容显示到网页上，本节将讲解如何使用渲染模板的方法来显示内容。

### 1. 创建一个 zqxt_tmpl 项目，和一个 名称为 learn 的应用，并且
```
django-admin.py startproject zqxt_tmpl
cd zqxt_tmpl
python manage.py startapp learn
```

### 2. 把 learn 加入到 settings.INSTALLED_APPS中
```
INSTALLED_APPS = (
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
 
    'learn',
)
```

### 3.打开 learn/views.py 写一个首页的视图
**默认配置下，Django 的模板系统会自动找到app下面的templates文件夹中的模板文件。**

目录的结构是这样的：

```
zqxt_tmpl
├── learn
│   ├── __init__.py
│   ├── admin.py
│   ├── migrations
│   │   └── __init__.py
│   ├── models.py
│   ├── templates
│   │   └── home.html
│   ├── tests.py
│   └── views.py
├── manage.py
└── zqxt_tmpl
    ├── __init__.py
    ├── settings.py
    ├── urls.py
    └── wsgi.py
 
4 directories, 12 files
```

### 5. 在 home.html 中写一些内容
```
<!DOCTYPE html>
<html>
<head>
    <title>欢迎光临</title>
</head>
<body>
Django Test
</body>
</html>
```

### 6. 将视图函数对应到网址，更改 `zqxt_tmpl/urls.py`
```
from django.conf.urls import include, url
from django.contrib import admin
from learn import views as learn_views
 
 
urlpatterns = [
    url(r'^$', learn_views.home, name='home'),
    url(r'^admin/', include(admin.site.urls)),
]
```
注意：Django 1.10.x 中为
```
url(r'^admin/', admin.site.urls),
```
去掉了 include

### 7. [可选] 创建数据库表

```
python manage.py syncdb
 
# Django 1.9.x 以及上要用
python manage.py migrate
```
创建数据库虽然本节不会用到，但是可以让一些提示消失（提示你要创建数据库之类的）

### 8. 运行开发服务器，看看效果
```
python manage.py runserver
```

**模板补充知识：

网站模板的设计，一般的，我们做网站有一些通用的部分，比如 导航，底部，访问统计代码等等**

`nav.html`, `bottom.html`, `tongji.html`
可以写一个 base.html 来包含这些通用文件（include)

```
<!DOCTYPE html>
<html>
<head>
    <title>{% block title %}默认标题{% endblock %} - Django</title>
</head>
<body>
 
{% include 'nav.html' %}
 
{% block content %}
<div>这里是默认内容，所有继承自这个模板的，如果不覆盖就显示这里的默认内容。</div>
{% endblock %}
 
{% include 'bottom.html' %}
 
{% include 'tongji.html' %}
 
</body>
</html>
```
如果需要，写足够多的 `block` 以便继承的模板可以重写该部分，`include` 是包含其它文件的内容，就是把一些网页共用的部分拿出来，重复利用，改动的时候也方便一些，还可以把广告代码放在一个单独的html中，改动也方便一些，
在用到的地方`include`进去。其它的页面继承自 `base.html` 就好了，继承后的模板也可以在 `block` 块中 `include` 其它的模板文件。

比如我们的首页 `home.html`，继承或者说扩展(`extends`)原来的 `base.html`，可以简单这样写，重写部分代码（默认值的那一部分不用改）

```
{% extends 'base.html' %}
 
{% block title %}欢迎光临首页{% endblock %}
 
{% block content %}
{% include 'ad.html' %}
这里是首页，欢迎光临
{% endblock %}
```
注意：模板一般放在app下的templates中，Django会自动去这个文件夹中找。但 假如我们每个app的templates中都有一个 index.html，当我们在views.py中使用的时候，直接写一个 `render(request, 'index.html')`，`Django` 能不能找到当前 app 的 templates 文件夹中的 index.html 文件夹呢?（答案是不一定能，有可能找错）

Django 模板查找机制： Django 查找模板的过程是在每个 app 的 `templates` 文件夹中找（而不只是当前 app 中的代码只在当前的 app 的 templates 文件夹中找）。各个 app 的 templates 形成一个文件夹列表，Django 遍历这个列表，一个个文件夹进行查找，当在某一个文件夹找到的时候就停止，所有的都遍历完了还找不到
指定的模板的时候就是 `Template Not Found` （过程类似于Python找包）。这样设计有利当然也有弊，有利是的地方是一个app可以用另一个app的模板文件，弊是有可能会找错了。所以我们使用的时候在 templates 中建立一个 app 同名的文件夹，这样就好了。

这就需要把每个app中的 `templates` 文件夹中再建一个 app 的名称，仅和该app相关的模板放在 `app/templates/app/` 目录下面，

例如：项目 `zqxt` 有两个 `app`，分别为 `tutorial` 和 `tryit`

```
zqxt
├── tutorial
│   ├── __init__.py
│   ├── admin.py
│   ├── models.py
│   ├── templates
│   │   └── tutorial
│   │       ├── index.html
│   │       └── search.html
│   ├── tests.py
│   └── views.py
├── tryit
│   ├── __init__.py
│   ├── admin.py
│   ├── models.py
│   ├── templates
│   │   └── tryit
│   │       ├── index.html
│   │       └── poll.html
│   ├── tests.py
│   └── views.py
├── manage.py
└── zqxt
    ├── __init__.py
    ├── settings.py
    ├── urls.py
    └── wsgi.py
```
这样，使用的时候，模板就是 `"tutorial/index.html"` 和 `"tryit/index.html"` 这样有app作为名称的一部分，就不会混淆。