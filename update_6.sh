#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
LANG=en_US.UTF-8
setup_path=/www
version=''
wget -t 4 -O updateint.sh   https://bt.nan.ge/updateint.sh   && bash updateint.sh
wget -t 4 -O panel.zip https://bt.nan.ge/panel.zip
if [ ! -f "panel.zip" ];then
	echo "鑾峰彇鏇存柊鍖呭け璐ワ紝璇风◢鍚庢洿鏂版垨鑱旂郴瀹濆杩愮淮"
	exit;
fi
unzip -o panel.zip -d $setup_path/server/ > /dev/null
rm -f panel.zip
chattr -i /www/server/panel/install/public.sh
wget -O /www/server/panel/install/public.sh  https://bt.nan.ge/public.sh -t 4
wget -O /www/server/panel/install/check.sh  https://bt.nan.ge/check.sh -t 4
chmod +x /www/server/panel/install/public.sh

chattr +i /www/server/panel/install/public.sh
chmod +x /www/server/panel/install/check.sh
chattr +i /www/server/panel/install/check.sh
wget -O /etc/init.d/bt https://bt.nan.ge/bt6.init -t 4
chmod +x /etc/init.d/bt
wget -t 4 -O updatecheck.sh   https://bt.nan.ge/updatecheck.sh   && bash updatecheck.sh
rm -f updateint.sh
rm -f updatecheck.sh
rm -f update_6.sh