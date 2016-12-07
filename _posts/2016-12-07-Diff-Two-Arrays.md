---
layout: post
title: Diff Two Arrays
categories: [blog ]
tags: [JavaScript, ]
description:  解决“Don't make functions within loop”错误
---

昨天在freeCodeCamp上面做题目，有一题的程序能够实现，但是会报一个错：Don't make functions within loop。我上网查了一下，原因是我在循环里面包含了函数体。题目跟初始代码如下：

##### 比较两个数组，然后返回一个新数组，该数组的元素为两个给定数组中所有独有的数组元素。换言之，返回两个数组的差异。
     
```     
function diff(arr1, arr2) {
  var newArr = [];
  for(var i=0; i<arr1.length; i++){
    if(arr2.indexOf(arr1[i]) > -1){
      arr2 = arr2.filter(function(item){  // ！Don't make functions within loop
   return item !== arr1[i];
                });
      arr1 = arr1.filter(function(item){  // ！Don't make functions within loop
            return item !== arr1[i];
      });
      --i;
    }
  }

  newArr = arr1.concat(arr2);
  return newArr;
}

diff([1, 2, 3, 5], [1, 2, 3, 4, 5]);
```

产生这个问题的根本原因是每次循环都会创建一个新的函数实例，这会让解释器产生很多函数实例，从而会导致怪异的行为及问题。

为了解决这个bug，我将函数体从循环内移出来了，果然这样程序就不会报错了。修改后的代码如下：

```
function diff(arr1, arr2) {
  var newArr = [];
  for(var i=0; i<arr1.length; i++){
    if(arr2.indexOf(arr1[i]) > -1){
      arr2 = arr2.filter(func());
      arr1 = arr1.filter(func());
      --i;
    }
  }

  function func(){
    return function choose(item){
       return item !== arr1[i];
    };
  }

  newArr = arr1.concat(arr2);
  return newArr;
}

diff([1, 2, 3, 5], [1, 2, 3, 4, 5]);

```

题目网址：https://www.freecodecamp.cn/challenges/diff-two-arrays

参考文章：http://jslint.fantasy.codes/dont-make-functions-within-a-loop/
