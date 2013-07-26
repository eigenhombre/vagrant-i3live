#!/bin/bash

cd /tmp
rm -f epel-release-6-8.noarch.rpm
curl -s http://mirror.symnds.com/distributions/fedora-epel/6/i386/epel-release-6-8.noarch.rpm > epel-release-6-8.noarch.rpm
sudo rpm -i --replacepkgs epel-release-6-8.noarch.rpm
