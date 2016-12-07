---
layout: post
title: Diff Two Arrays
categories: [blog ]
tags: [JavaScript, ]
description:  解决“Don't make functions within loop”错误
---

题目：将给定的数字转换成大写的罗马数字（数字在1-3999的范围内）。

罗马数字一共有七个：I（1）、V（5）、X（10）、L（50）、C（100）、D（500）、M（1000），它的计算规则是：

    1、一个罗马数字重复几次，就代表这个数的几倍；

    2、左加右减：

        在较大的罗马数字左边记上较小的罗马数字表示大数字减小数字
    
        在较大的罗马数字右边记上较小的罗马数字表示大数字加小数字
    
    3、每位数字分别表示，如99用IC（100-1）表示是错的，正确的表示是XCIX（100-10 10-1）；

    4、左减的数字只能是一位数，所以9可以写成IX，而8只能写成VIII（5+3）。
   
    5、右加的数字不能连续超过三个，如40写成XL（50-10）而不能是XXXX。

由此，我们可以对高于三次的基本字符进行先处理：

<center>
    <table border='0' text-align='center'>
        <tr>
            <td>I</td>
            <td>IV</td>
            <td>V</td>
            <td>IX</td>
            <td>X</td>
            <td>XL</td>
            <td>L</td>
            <td>XC</td>
            <td>C</td>
            <td>D</td>
            <td>CM</td>
            <td>M</td>
        </tr>
        <tr>
            <td>1</td>
            <td>4</td>
            <td>5</td>
            <td>9</td>
            <td>10</td>
            <td>40</td>
            <td>50</td>
            <td>90</td>
            <td>100</td>
            <td>500</td>
            <td>900</td>
            <td>1000</td>
        </tr>
    </table>
</center>

这样就可以基于这12个字符对任一罗马数字进行加法操作了，即：大数在左，小数在右。

完整的程序代码如下：

```
function convert(num) {
  var numbers = [1000, 900, 500, 100, 90, 50, 40, 10, 9, 5, 4, 1],
      letters = ['M', 'CM', 'D', 'C', 'XC', 'L', 'XL', 'X', 'IX', 'V', 'IV', 'I'],
      i ,j, count,
      str='';
  for(i=0; i<13; i++){
    if(num >= numbers[i]){
      count = Math.floor(num / numbers[i]);
      num = num % numbers[i];
      for(j=0; j<count; j++){
        str += letters[i];
      }
    }
  }
 return str;
}

convert(36);
```


题目网址：https://www.freecodecamp.cn/challenges/roman-numeral-converter

参考文章：http://www.cnblogs.com/theskulls/p/4957173.html

