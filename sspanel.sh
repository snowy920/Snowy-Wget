echo 欢迎使用ss-panel-v3-mod一键安装脚本
echo 使用前请确保已安装好生产环境
stty erase '^H' && read -p "(请输入网站目录最后一项):" mulu
cd /www/wwwroot/"${mulu}"
yum -y install git
git clone -b master https://github.com/NimaQu/ss-panel-v3-mod_Uim.git tmp && mv tmp/.git . && rm -rf tmp && git reset --hard
chown -R root:root *
chmod -R 755 *
chown -R www:www storage
php composer.phar install
mv tool/alipay-f2fpay vendor/
mv -f tool/cacert.pem vendor/guzzle/guzzle/src/Guzzle/Http/Resources/
mv -f tool/autoload_classmap.php vendor/composer/
cp config/.config.php.example config/.config.php
