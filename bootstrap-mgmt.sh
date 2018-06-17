#!/usr/bin/env bash

# install ansible (http://docs.ansible.com/intro_installation.html)
apt-get -y install software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get -y install ansible

# copy examples into /home/vagrant (from inside the mgmt node)
cp -a /vagrant/ans/* /home/vagrant
chown -R vagrant:vagrant /home/vagrant

cp /vagrant/ans/inventory.ini /etc/ansible/hosts

# configure hosts file for the internal network defined by Vagrantfile
cat >> /etc/hosts <<EOL

# vagrant environment nodes
192.168.56.10  mgmt
192.168.56.11  opendaylight
192.168.56.12  mininet
EOL
