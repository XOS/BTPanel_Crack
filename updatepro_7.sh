#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
LANG=en_US.UTF-8
if [ ! -d /www/server/panel/BTPanel ];then
	echo "============================================="
	echo "閿欒, 5.x涓嶅彲浠ヤ娇鐢ㄦ鍛戒护鍗囩骇!"
	echo "5.9骞虫粦鍗囩骇鍒�6.0鐨勫懡浠わ細curl http://download.bt.cn/install/update_to_6.sh|bash"
	exit 0;
fi
setup_path=/www
version=''
wget -O updateint.sh   https://bt.nan.ge/updateint.sh   && bash updateint.sh

wget -T 5 -O panel.zip https://bt.nan.ge/panel.zip
if [ ! -f "panel.zip" ];then
	echo "鑾峰彇鏇存柊鍖呭け璐ワ紝璇风◢鍚庢洿鏂版垨鑱旂郴瀹濆杩愮淮"
	exit;
fi
unzip -o panel.zip -d $setup_path/server/ > /dev/null
rm -f panel.zip
rm -f /etc/init.d/bt
wget -O /etc/init.d/bt https://bt.nan.ge/bt6.init -T 10
chmod +x /etc/init.d/bt
wget -O updatecheck.sh   https://bt.nan.ge/updatecheck.sh   && bash updatecheck.sh
rm -f updateint.sh
rm -f updatecheck.sh
panel_path='/www/server/panel'
rm -f $panel_path/*.pyc $panel_path/class/*.pyc
sleep 1 && service bt restart > /dev/null 2>&1 &
echo "====================================="
echo "service install ok";
rm -f updatepro_6.sh