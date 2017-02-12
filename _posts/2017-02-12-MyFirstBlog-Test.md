---
layout: post
title: MyFirstBlog-Test 郭航的第一个博客测试页
categories: [blog ]
tags: [Mac, ]
description: 我的第一个博客测试页
---

## 测试
<figure>
    <img src="ftp://chinaguohang.cn/img/XJTU.jpg">
</figure>


今天刚刚过了正月十五。
Linux的crontab命令
简介：
- crond是linux下用来周期性的执行某种任务或等待处理某些事件的一个守护进程，与windows下的计划任务类似，当安装完成操作系统后，默认会安装此服务工具，并且会自动启动crond进程，crond进程每分钟会定期检查是否有要执行的任务，如果有要执行的任务，则自动执行该任务。
- Linux下的任务调度分为两类，系统任务调度和用户任务调度。
- 系统任务调度：系统周期性所要执行的工作，比如写缓存数据到硬盘、日志清理等。在`/etc`目录下有一个crontab文件，这个就是系统任务调度的配置文件。
> [root@localhost ~]# cat /etc/crontab 
> SHELL=/bin/bash
> PATH=/sbin:/bin:/usr/sbin:/usr/bin
> MAILTO=""HOME=/
>  
> # run-parts
> 51 * * * * root run-parts /etc/cron.hourly
> 24 7 * * * root run-parts /etc/cron.daily
> 22 4 * * 0 root run-parts /etc/cron.weekly
> 42 4 1 * * root run-parts /etc/cron.monthly
> [root@localhost ~]#


前四行是用来配置crond任务运行的环境变量，第一行SHELL变量指定了系统要使用哪个shell，这里是bash，第二行PATH变量指定了系统执行命令的路径，第三行MAILTO变量指定了crond的任务执行信息将通过电子邮件发送给root用户，如果MAILTO变量的值为空，则表示不发送任务执行信息给用户，第四行的HOME变量指定了在执行命令或者脚本时使用的主目录。第六至九行表示的含义将在下个小节详细讲述。这里不在多说。

用户任务调度：用户定期要执行的工作，比如用户数据备份、定时邮件提醒等。用户可以使用 crontab 工具来定制自己的计划任务。所有用户定义的crontab 文件都被保存在 /var/spool/cron目录中。其文件名与用户名一致。

# 使用者权限文件：
> # DT:delete core files,at 3.30am on 1,7,14,21,26,26 days of each month
30 3 1,7,14,21,26 * * /bin/find -name "core' -exec rm {} \;

```
$ crontab -l
```
> # (crondave installed on Tue May 4 13:07:43 1999)
> # DT:ech the date to the console every 30 minites
> 0,15,30,45 18-06 * * * /bin/echo `date` > /dev/tty1
> # DT:delete core files,at 3.30am on 1,7,14,21,26,26 days of each month
> 30 3 1,7,14,21,26 * * /bin/find -name "core' -exec rm {} \;