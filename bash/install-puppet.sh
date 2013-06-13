#!/bin/bash

sudo rpm -ivh http://yum.puppetlabs.com/el/6/products/i386/puppetlabs-release-6-7.noarch.rpm
sudo sed -i 's/enabled=0/enabled=1/g' /etc/yum.repos.d/puppetlabs.repo 
sudo yum install -y puppet-server
sudo yum install -y puppet
