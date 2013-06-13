#!/bin/bash

cd /tmp
curl http://mirror.symnds.com/distributions/fedora-epel/6/i386/epel-release-6-8.noarch.rpm > epel-release-6-8.noarch.rpm
sudo rpm -ivh epel-release-6-8.noarch.rpm
