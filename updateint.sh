#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
LANG=en_US.UTF-8
chattr -i /www/server/panel/class/panelAuth.py
chattr -i /www/server/panel/class/panelPlugin.py
chattr -i /www/server/panel/class/public.py
chattr -R -ia /www/server/panel
chattr -ia /dev/shm/session.db
chattr -ia /etc/init.d/bt 
chattr -i /etc/init.d/bt 
echo "False" > /etc/bt_crack.pl
p_path=/www/server/panel/class/panelPlugin.py
if [ ! -f "${p_path}" ];then
		chattr -R -ia /www
		cp -ri /www/backup/panel/vhost/* /www/server/panel/vhost/*
		curl http://download.bt.cn/install/update6.sh|bash
	fi