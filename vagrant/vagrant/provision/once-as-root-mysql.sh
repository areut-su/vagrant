#!/usr/bin/env bash

apt-get install -y mysql-server-5.7
info "Configure MySQL"
sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
mysql -uroot <<< "CREATE USER 'root'@'%' IDENTIFIED BY ''"
mysql -uroot <<< "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%'"
mysql -uroot <<< "DROP USER 'root'@'localhost'"
mysql -uroot <<< "FLUSH PRIVILEGES"
echo "Done!"
info "Initailize databases for MySQL"
# mysql -uroot <<< "CREATE DATABASE yii2advanced"
# mysql -uroot <<< "CREATE DATABASE yii2advanced_test"
mysql -uroot <<< "CREATE DATABASE site_1"
mysql -uroot <<< "CREATE DATABASE site_2"
mysql -uroot <<< "CREATE DATABASE wordpress"
mysql -uroot <<< "CREATE DATABASE yii_site"
echo "Done!"