#!/usr/bin/env bash
#== Задаем нвого пользователя
info "create user phpstorm(root)"
sudo mkdir /home/phpstorm
sudo useradd -ou 0 -g 0 phpstorm
echo -e "phpstorm\nphpstorm\n" | passwd phpstorm

#== Даем права root для работы ssh
sed -i 's/^PermitRootLogin prohibit-password/# PermitRootLogin prohibit-password\nPermitRootLogin yes/g' /etc/ssh/sshd_config
grep PermitRootLogin /etc/ssh/sshd_config