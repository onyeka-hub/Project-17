#!/bin/bash

mkdir /var/www/

sudo mount -t efs -o tls,accesspoint=fsap-0dbaea15f60fef324 fs-00db5104674d12683:/ /var/www/

sudo yum install -y httpd

sudo systemctl start httpd

sudo systemctl enable httpd

sudo yum module reset php -y

sudo yum module enable php:remi-7.4 -y

sudo yum install -y php php-common php-mbstring php-opcache php-intl php-xml php-gd php-curl php-mysqlnd php-fpm php-json

sudo systemctl start php-fpm

sudo systemctl enable php-fpm

wget http://wordpress.org/latest.tar.gz

tar xzvf latest.tar.gz

rm -rf latest.tar.gz

cp wordpress/wp-config-sample.php wordpress/wp-config.php

mkdir /var/www/html/

cp -R /wordpress/* /var/www/html/

cd /var/www/html/

touch healthstatus

sudo sed -i "s/localhost/database-1.chqrr77fijqc.us-east-2.rds.amazonaws.com/g" wp-config.php

sudo sed -i "s/username_here/onyi_admin/g" wp-config.php

sudo sed -i "s/password_here/admin12345/g" wp-config.php

sudo sed -i "s/database_name_here/wordpressdb/g" wp-config.php

sudo chcon -t httpd_sys_rw_content_t /var/www/html/ -R

sudo systemctl restart httpd

