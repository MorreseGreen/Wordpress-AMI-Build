#!/bin/bash
sleep 30

sudo apt-get update
yes | sudo apt-get install apache2 php php-mysql php-curl mysql-client libapache2-mod-php unzip nano pip
cd /var/www/ && sudo wget https://wordpress.org/latest.zip
sudo unzip /var/www/latest.zip
cd /var/www/wordpress/ && touch wp-config.php