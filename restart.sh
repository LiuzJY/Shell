#!/bin/bash

echo '####开始执行####'

user_name=`pwd|awk -F "/" '{print $3}'|grep activity`
echo 'username=' ${user_name}

if [ ${user_name} ]
then
	echo '####获取并结束tomcat进程#####'
	
	tomcat_PID=`ps -ef|grep tomcat|grep ${user_name}|awk '{print $2}'`
	echo 'tomcatpid=' ${tomcat_PID}	
	kill -9 ${tomcat_PID}
	
	echo '####正在重启####'
	/home/${user_name}/tomcat8/bin/startup.sh
	tail -f /home/${user_name}/tomcat8/logs/catalina.out
else
	echo '未找到用户名，请进入需要重启的tomcat对应用户的任意目录下'
fi
