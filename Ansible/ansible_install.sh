#!/usr/bin/env bash

# Usage Example:
# ./install_ansible.sh 'v1.1' path/to/local/ansible/hosts/file
# Look up https://github.com/ansible/ansible for version tags to use

versionTag=$1
ansibleHosts=$2

# Install Git
# The most stable way of getting the latest version of ansible to get it directly from the git repo
echo "[Install Ansible] Install Git"
sudo apt-get install -y git-core

# Install Ansible Dependencies
echo '[Install Ansible] Install dependencies'
sudo apt-get install -y python-setuptools
sudo easy_install jinja2 
sudo easy_install pyyaml
sudo easy_install paramiko

# Install Ansible
echo "[Install Ansible] Go to Home folder"
cd ~
echo '[Install Ansible] Git Clone Ansible'
git clone https://github.com/ansible/ansible.git ansible
cd ansible

echo '[Install Ansible] Checkout to desired tag'
git checkout $versionTag

echo '[Install Ansible] Make and Install'
sudo make install

echo '[Install Ansible] Clean up!'
cd ..
sudo rm -rf ansible

echo '[Install Ansible] Copy Ansible HOSTS'
sudo mkdir -p /etc/ansible && sudo cp -fr $ansibleHosts /etc/ansible/hosts

echo '[Install Ansible] Update Permissions on hosts file'
# Giving exec permission causes issues when running ansible
sudo chmod 644 /etc/ansible/hosts

echo '[Install Ansible] Export ANSIBLE_HOST path'
export ANSIBLE_HOSTS=/etc/ansible/hosts

echo '[Install Ansible] Done!'
