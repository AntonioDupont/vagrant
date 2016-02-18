#!/bin/bash

# MySQL
yum install -y mariadb mariadb-server mariadb-devel
systemctl enable mariadb
systemctl start mariadb

