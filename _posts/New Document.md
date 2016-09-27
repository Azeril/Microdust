#gitlab的初学体验
##gitlab的下载
###首先将系统防火墙打开http和ssh访问：
<pre>
yum install curl openssh-server postfix
systemctl enable sshd postfix
systemctl start sshd postfix
firewall-cmd --permanent --add-service=http
systemctl reload firewalld
</pre>
###添加gitlab服务器安装包：
<pre>
curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh| sudo bash
yum install gitlab-ce
</pre>
###（可忽略）如果存在gitlab-ce的安装包，可以直接解压安装包：
<pre>
rpm -i gitlab-ce-8.8.5-ce.1.el7.x86_64.rpm
</pre>
###配置并启动gitlab
<pre>
gitlab-ctl reconfigure
gitlab-ctl status
gitlab-ctl stop
gitlab-ctl start
</pre>
###重启nginx服务：
<pre>
/etc/init.d/nginx restart
</pre>
##通过浏览器访问gitlab服务器IP进行登录访问：
