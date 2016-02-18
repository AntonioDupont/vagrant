#!/bin/bash

# System update
yum -y update --exclude=kernel

# Tools
yum install -y nano git unzip screen

# Apache
yum install -y httpd httpd-devel httpd-tools
systemctl enable httpd
systemctl stop httpd

# Symlink folder that Apache serves web pages from
rm -rf /var/www/html
ln -s /vagrant /var/www/html

# Apache - start
systemctl start httpd

# PHP
yum install -y php php-cli php-common php-devel php-mysql

# MySQL
yum install -y mariadb mariadb-server mariadb-devel
systemctl enable mariadb
systemctl start mariadb

# Download starter content into our shared folder
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/AntonioDupont/vagrant/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/AntonioDupont/vagrant/master/files/info.php

systemctl restart httpd

