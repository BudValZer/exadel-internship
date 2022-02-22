#!/bin/bash
sudo apt update
sudo apt install nginx -y
sudo bash -c 'echo "<br>hello, world! OS version is:<br>" > /var/www/html/*.html'
sudo bash -c 'lsb_release -a >> /var/www/html/*.html'