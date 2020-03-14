#!/usr/bin/env bash

# install php and nginx

info "Add PHp 7.1 repository"
apt-get install software-properties-common python-software-properties
apt install --reinstall software-properties-common
apt-get install -y language-pack-en-base
LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php
apt-get update

#add-apt-repository ppa:ondrej/php

info "Update OS software"
#apt-get update
#apt-get upgrade -y

apt-get update
apt-get install -y php7.1-fpm


info "Install additional software"
info "Install additional php7.1-curl"
info "Install additional php7.1-cli"
apt-get install -y php7.1-curl
apt-get install -y php7.1-cli
apt-get install -y php7.1-fpm
apt-get install -y php7.1-intl
apt-get install -y php7.1-mysqlnd

apt-get install -y php7.1-gd
apt-get install -y php7.1-mbstring
apt-get install -y php7.1-xml
apt-get install -y unzip

#sudo apt-get install -y php7.1-fpm
#apt-get install -y php7.1-fpm

info "Install additional php7.1-fpm 2"
#apt-get update
# sudo phpenmod xdebug
# sudo phpdismod xdebug
apt-get install -y php.xdebug


apt-get install -y nginx

apt-get update

#sudo apt-get install -y php7.1-fpm

apt-get install -y php7.1-fpm


info "Configure PHP-FPM"
sed -i 's/user = www-data/user = vagrant/g' /etc/php/7.1/fpm/pool.d/www.conf

sed -i 's/group = www-data/group = vagrant/g' /etc/php/7.1/fpm/pool.d/www.conf

sed -i 's/owner = www-data/owner = vagrant/g' /etc/php/7.1/fpm/pool.d/www.conf

cat << EOF > /etc/php/7.1/mods-available/xdebug.ini
zend_extension=xdebug.so
xdebug.remote_enable=1
xdebug.remote_connect_back=1
xdebug.remote_log=/tmp/php-xdebug.log
xdebug.remote_port=9000
xdebug.remote_autostart=1
xdebug.idekey=PHPSTORM
xdebug.remote_host=192.168.83.171 # IP vagran mashine
EOF
echo "Done!"
