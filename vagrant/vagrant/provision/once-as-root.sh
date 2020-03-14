#!/usr/bin/env bash

source /app/vagrant/provision/common.sh

#== Import script args ==

timezone=$(echo "$1")

#== Provision script ==

info "Provision-script user: `whoami`"

export DEBIAN_FRONTEND=noninteractive

info "Configure timezone"
timedatectl set-timezone ${timezone} --no-ask-password

info "Prepare root password for MySQL"
debconf-set-selections <<< "mysql-community-server mysql-community-server/root-pass password \"''\""
debconf-set-selections <<< "mysql-community-server mysql-community-server/re-root-pass password \"''\""
echo "Done!"

apt-get upgrade -y
apt-get update
#apt-get update

info "insatll  mysql"
source /app/vagrant/provision/once-as-root-mysql.sh


info "insatll  PHP"
source /app/vagrant/provision/once-as-root-php.sh


info "insatll  GOLANG"
# source /app/vagrant/provision/once-as-root-go.sh



info "Configure NGINX"
sed -i 's/user www-data/user vagrant/g' /etc/nginx/nginx.conf
echo "Done!"

info "Enabling site configuration"
ln -s /app/vagrant/nginx/app.conf /etc/nginx/sites-enabled/app.conf
echo "Done!"



info "Install composer"
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

info "user phpstorm"
source /app/vagrant/provision/once-as-root-user-phpstorm.sh

#--------
info "Install mc"
apt install -y mc

#--------
info "install wp-cli"
source /app/vagrant/provision/once-as-root-wp-cli.sh

