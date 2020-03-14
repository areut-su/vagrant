#!/usr/bin/env bash

source /app/vagrant/provision/common.sh

#== Provision script ==
info "disable xdebug:phpdismod "

sudo phpenmod xdebug
#sudo phpdismod xdebug

info "Provision-script user: `whoami`"

info "Restart web-stack"
service php7.1-fpm restart
service nginx restart
service mysql restart
