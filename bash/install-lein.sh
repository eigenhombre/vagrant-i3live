#!/bin/bash

mkdir -p /home/vagrant/bin
curl https://raw.github.com/technomancy/leiningen/stable/bin/lein > /home/vagrant/bin/lein
chmod 0755 /home/vagrant/bin/lein
