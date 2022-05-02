#!/bin/bash
sleep 30

sudo apt-get update
yes | sudo apt-get install apache2 php php-mysql php-curl mysql-client libapache2-mod-php unzip nano
cd /var/www/ && sudo wget https://wordpress.org/latest.zip
sudo unzip /var/www/latest.zip
sudo bash -c "cd /var/www/wordpress/ && cp wp-config-sample.php wp-config.php"