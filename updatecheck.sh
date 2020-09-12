#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
LANG=en_US.UTF-8
chattr +i /www/server/panel/class/panelAuth.py
chattr +i /www/server/panel/class/panelPlugin.py
chattr +i /www/server/panel/class/public.py
chattr +i /etc/init.d/bt