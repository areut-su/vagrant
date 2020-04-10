#!/usr/bin/env bash

info "Add PHp 7.3 repository"
apt-get install -y software-properties-common
add-apt-repository -y ppa:ondrej/php

info "Update OS software"
apt-get update -y & apt-get upgrade -y

apt-get install -y php7.3

# install php and nginx
# apt-get install software-properties-common python-software-properties
# apt install --reinstall software-properties-common
# apt-get install -y language-pack-en-base
#LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php
#apt-get update
#add-apt-repository ppa:ondrej/php

#apt-get update
#apt-get upgrade -y
#sudo apt-get install -y language-pack-en-base && sudo export LC_ALL=en_US.UTF-8 && sudo export LANG=en_US.UTF-8 && sudo apt-get install -y software-properties-common
#add-apt-repository ppa:ondrej/php

info "Install additional software"
#apt-get install -y php7.3-fpm curl php7.3 php7.3-bcmath php7.3-bz2 php7.3-cli php7.3-curl php7.3-intl php7.3-json php7.3-mbstring php7.3-opcache php7.3-soap php7.3-sqlite3 php7.3-xml php7.3-xsl php7.3-zip unzip

apt-get install -y php7.3-curl
apt-get install -y php7.3-cli
apt-get install -y php7.3-fpm
apt-get install -y php7.3-intl
apt-get install -y php7.3-mysqlnd
apt-get install -y php7.3-sqlite3
apt-get install -y php7.3-json
apt-get install -y php7.3-mbstring

apt-get install -y php7.3-gd
apt-get install -y php7.3-mbstring
apt-get install -y php7.3-xml
apt-get install -y php7.3-opcache
apt-get install -y php7.3-soap
apt-get install -y php7.3-xml

apt-get install -y php7.3-xsl
apt-get install -y php7.3-zip

apt-get install -y unzip

#sudo apt-get install -y php7.1-fpm
#apt-get install -y php7.1-fpm

info "Install additional php 7"
# sudo phpenmod xdebug
# sudo phpdismod xdebug
apt-get install -y php.xdebug

info "Update OS software"
apt-get update -y && apt-get upgrade -y

#sudo apt-get install -y php7.1-fpm

#apt-get install -y php7.1-fpm

info "Configure PHP-FPM"
sed -i 's/user = www-data/user = vagrant/g' /etc/php/7.3/fpm/pool.d/www.conf

sed -i 's/group = www-data/group = vagrant/g' /etc/php/7.3/fpm/pool.d/www.conf

sed -i 's/owner = www-data/owner = vagrant/g' /etc/php/7.3/fpm/pool.d/www.conf

cat <<EOF >/etc/php/7.3/mods-available/xdebug.ini
zend_extension=xdebug.so
xdebug.remote_enable=1
xdebug.remote_connect_back=1
xdebug.remote_log=/tmp/php-xdebug.log
xdebug.remote_port=9000
xdebug.remote_autostart=1
xdebug.idekey=PHPSTORM
xdebug.remote_host=192.168.83.137 # IP vagran mashine
EOF
echo "Done!"

info "set php - cli defautl php7.3"
sudo update-alternatives --set php /usr/bin/php7.3
