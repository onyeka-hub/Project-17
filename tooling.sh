#!/bin/bash

mkdir /var/www/

sudo mount -t efs -o tls,accesspoint=fsap-0ec6f604bffb9b35e fs-00db5104674d12683:/ /var/www/

sudo yum install -y httpd 

sudo systemctl start httpd

sudo systemctl enable httpd

sudo yum module reset php -y

sudo yum module enable php:remi-7.4 -y

sudo yum install -y php php-common php-mbstring php-opcache php-intl php-xml php-gd php-curl php-mysqlnd php-fpm php-json

sudo systemctl start php-fpm

sudo systemctl enable php-fpm

git clone https://github.com/onyeka-hub/tooling.git

mkdir /var/www/html

cp -R /tooling/html/*  /var/www/html/

cd /tooling

mysql -h database-1.chqrr77fijqc.us-east-2.rds.amazonaws.com -u onyi_admin -p admin12345 toolingdb < tooling-db.sql

cd /var/www/html/

touch healthstatus

sed -i "s/$db = mysqli_connect('mysql.tooling.svc.cluster.local', 'admin', 'admin', 'tooling');/$db = mysqli_connect('database-1.chqrr77fijqc.us-east-2.rds.amazonaws.com', 'onyi_admin', 'admin12345', 'toolingdb');/g" functions.php

sudo chcon -t httpd_sys_rw_content_t /var/www/html/ -R

sudo systemctl restart httpd
