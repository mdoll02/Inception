#!/bin/sh

mkdir -p /var/www/
mkdir -p /var/www/html
mkdir -p /run/php

chown www-data:www-data /run/php

#Download wordpress

cd /var/www/html
rm -rf *
wget https://wordpress.org/latest.tar.gz > /dev/null 2>&1
tar -xzvf latest.tar.gz > /dev/null 2>&1
rm -rf latest.tar.gz

#Inport env variables in the config file

chmod 755 -R /var/www/html/wordpress
chown -R www-data:www-data /var/www/html/wordpress

cd /var/www/html/wordpress
sed -i "s/username_here/$WP_DB_USER/g" wp-config-sample.php
sed -i "s/password_here/$WP_DB_PASSWORD/g" wp-config-sample.php
sed -i "s/localhost/$WP_DB_HOST/g" wp-config-sample.php
sed -i "s/database_name_here/$WP_DB_NAME/g" wp-config-sample.php
mv wp-config-sample.php wp-config.php

/usr/sbin/php-fpm7.3 -F
