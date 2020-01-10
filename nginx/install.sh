#!/bin/bash
#Create the file named /etc/yum.repos.d/nginx.repo using a text editor such as vim command
sudo touch /etc/yum.repos.d/nginx.repo

echo '[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/mainline/rhel/8/$basearch/
gpgcheck=0
enabled=1' | sudo tee /etc/yum.repos.d/nginx.repo

#Install nginx package using the yum
sudo yum update && sudo yum install nginx

        sleep 2

sudo systemctl enable nginx
                echo "ngix enabled"
sudo systemctl start nginx
                echo "ngix is running"
sudo systemctl status nginx
        sleep 2
#Stop Nginx command
#sudo systemctl stop nginx
# Restart Nginx command
# sudo systemctl restart nginx
sudo yum install -y  firewalld
sudo yum install -y  firewall-config
sudo yum install -y firewall-applet
        sleep 1
sudo systemctl enable firewalld
sudo systemctl start firewalld
sudo systemctl status firewalld
sudo firewall-cmd --state
#systemctl disable firewalld
#systemctl stop firewalld
        sleep 1
sudo firewall-cmd --permanent --zone=public --add-service=http
sudo firewall-cmd --permanent --zone=public --add-service=https
sudo firewall-cmd --reload
        sleep 3
#Verify that port 80 or 443 opened
sudo ss -tulpn

IP=`hostname -I`
echo "$IP" | curl -I $IP
        sleep 3
curl $IP








