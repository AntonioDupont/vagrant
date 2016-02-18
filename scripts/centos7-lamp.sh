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

systemctl start httpd

# PHP
yum install -y php php-cli php-common php-devel php-mysql

#MySQL
yum instlal -y mariadb mariadb-server mariadb-devel
systemctl enable mariadb
systemctl start mariadb

# Download Start Content
systemctl restart httpd

