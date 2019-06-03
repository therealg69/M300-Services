#!/bin/sh
sudo apt-get -y install apache2
sudo ufw --force enable   

sudo ufw allow 80/tcp
sudo ufw allow ssh

echo "ServerName localhost" >> /etc/apache2/apache2.conf
sudo service apache2 restart