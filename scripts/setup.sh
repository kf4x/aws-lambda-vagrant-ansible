#!/bin/bash

# Author: Javier Chavez

# provisions lambda deployment vm


PROVISIONED_ON=/etc/vm_provision_on_timestamp
if [ -f "$PROVISIONED_ON" ]
then
  echo "VM was already provisioned at: $(cat $PROVISIONED_ON)"
  echo "To run system updates manually login via 'vagrant ssh' and run 'apt-get update && apt-get upgrade'"
  exit
fi

add-apt-repository -y ppa:deadsnakes/ppa
apt-add-repository -y ppa:ansible/ansible

apt-get -qq update


########################
#       Dev libs       #
########################
apt-get -qq install openssl libssl-dev automake build-essential git ansible

########################
#       Python         #
########################
apt-get -qq install python3.6 python3.6-dev python3-pip python3-setuptools


apt-get -f install
apt-get -y autoremove
apt-get -y autoclean

########################
#        Python        #
########################
pip3 install -U pip
pip3 install virtualenv

# Create env but with user's creds
sudo su vagrant -c "mkdir /home/vagrant/venvs"
sudo su vagrant -c "virtualenv \"/home/vagrant/venvs/ansible\" --python=python3.6"

# set up ansible env
source /home/vagrant/venvs/ansible/bin/activate
pip3 install awscli boto3 boto botocore
deactivate


########################
#        Other         #
########################
sudo mv /etc/ansible/hosts /etc/ansible/hosts.orig
sudo cp -rf /vagrant/template/hosts /etc/ansible/hosts
sudo ssh-keyscan nix >>.ssh/known_hosts


sudo su vagrant -c "mkdir /home/vagrant/.aws"
sudo su vagrant -c "touch /home/vagrant/.aws/credentials"


date > "$PROVISIONED_ON"

# cd /home/vagrant
# echo "Git Username:"
# read git_username

# echo "Git Password:"
# read -sr git_password

# install configuration files for bash, emacs, and vim
cd /vagrant/configs
./setup.sh
