---
layout: post
title: JavaScript复制对象
categories: [blog ]
tags: [AngularJS, JavaScript ]
description: js复制对象问题
---

今天想实现一个功能，有一个数组arr，里面存储的是对象，使用ng-repeat将数据输出在页面。同时可以新增数据，提交成功后即将新增数据追加在页面。我用了一个对象存储输入的值，这样可以在提交后直接将对象push到数组中，然后就可以将数据追加到页面了。

但是很快，我就发现问题了。第一次提交，数据能成功追加到页面，但第二次添加数据时，输入框内的内容改变，页面追加的数据也会跟着改变，我突然意识到，js对象是引用类型，将对象a直接赋值给对象b时，它们引用的其实都是同一个对象，这就会导致你修改一个对象时另一个对象也改变。

想要得到一个拷贝的对象可以使用下面两种方法。

（其实是网上找的，地址在这：<http://www.cnblogs.com/spring4/archive/2012/03/29/2483708.html>）

方法一：定义一个clone方法来实现。
```
function clone(myObj){  
  if(typeof(myObj) != 'object') return myObj;  
  if(myObj == null) return myObj;  
  var myNewObj = new Object();   
  for(var i in myObj){
    myNewObj[i] = clone(myObj[i]); 
  } 
  return myNewObj;  
} 
```

方法二：通过object原型扩展实现
```
Object.prototype.Clone = function(){  
  var objClone;  
  if(this.constructor == Object){
    objClone = new this.constructor();
  }else{
    objClone = new this.constructor(this.valueOf());  
  }
  for(var key in this){  
    if (objClone[key] != this[key]){  
        if (typeof(this[key]) == 'object'){  
          objClone[key] = this[key].Clone();  
        }else{  
          objClone[key] = this[key];  
        }  
     }  
  }  
  objClone.toString = this.toString;  
  objClone.valueOf = this.valueOf;  
  return objClone;  
}   
```
