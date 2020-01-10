#!/bin/bash
#Download the latest release
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

#Make the kubectl binary executable
        chmod +x ./kubectl

# Move the binary in to your PATH.
         sudo mv ./kubectl /usr/local/bin/kubectl

      kubectl version 

#Install using native package management
##CentOS, RHEL or Fedora
   sudo touch /etc/yum.repos.d/kubernetes.repo
sleep 2

sudo echo '[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg' | sudo tee  /etc/yum.repos.d/kubernetes.repo

sudo yum install -y kubectl

