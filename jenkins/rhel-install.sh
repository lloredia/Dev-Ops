#!/bin/sh -e

#Add Jenkins Repository
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import http://pkg.jenkins.io/redhat-stable/jenkins.io.key

#Install Jenkins and Java
sudo yum install -y jenkins
sudo yum install -y java-1.8.0-openjdk

#Start and Enable Jenkins Service

sudo systemctl start jenkins
sudo systemctl enable jenkins

sudo yum install -y  firewalld
sudo yum install -y  firewall-config
sudo yum install -y firewall-applet
        sleep 1

#open the ports (80 and 8080) in OS firewall.
sudo firewall-cmd --zone=public --add-port=8080/tcp --permanent
sudo firewall-cmd --zone=public --add-service=http --permanent
sudo firewall-cmd --reload

        sleep 2
#test -----> Access the URL : http://<Ip-Address-of-your-Server>:8080
ps -aux | grep jenkins

sudo cat /var/lib/jenkins/secrets/initialAdminPassword


