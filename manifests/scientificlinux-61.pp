group { "puppet": ensure => "present", }

File { owner => 0, group => 0, mode => 0644 }

file { '/etc/motd': content => "Vagrant SL6.1 dev box for IceCube Live\n" }

package { 'wget': ensure => installed }
package { 'man': ensure => installed }
package { 'zeromq': ensure => installed }
package { 'zeromq-devel': ensure => installed }
package { 'gcc': ensure => installed }
package { 'gcc-c++': ensure => installed }
package { 'git': ensure => installed }
package { 'diffutils': ensure => installed }
package { 'blas-devel': ensure => installed }
package { 'lapack-devel': ensure => installed }
package { 'mysql': ensure => installed }
#package { 'MySQL-python': ensure => installed }
package { 'mysql-server': ensure => installed }
package { 'mysql-devel': ensure => installed }

service { 'mysqld':
  enable => true,
  ensure => running,
  require => Package["mysql-server"]
}

package { 'libxml2': ensure => installed }
package { 'libxml2-devel': ensure => installed }
package { 'libxslt': ensure => installed }
package { 'libxslt-devel': ensure => installed }

# package { 'mongodb': ensure => installed }
# package { 'mongodb-devel': ensure => installed }
# package { 'mongodb-server': ensure => installed }

package { 'mongo-10gen': ensure => installed }
package { 'mongo-10gen-server': ensure => installed }


service { 'mongod':
  enable => true,
  ensure => running,
  require => Package["mongo-10gen-server"]
}


# Virtualenv for python

exec { "python/virtualenv":
  require => Package["python-virtualenv"],
  command => "/usr/bin/virtualenv /home/vagrant/venv",
  creates => ["/home/vagrant/venv"],
  user => "vagrant",
}


# From http://bitfieldconsulting.com/puppet-and-mysql-create-databases-and-users:
define mysqldb( $user, $password ) {
  exec { "create-${name}-db":
    unless => "/usr/bin/mysql -u${user} -p${password} ${name}",
    command => "/usr/bin/mysql -uroot -e \"create database ${name}; grant all on ${name}.* to ${user}@localhost identified by '$password';\"",
    require => Service["mysqld"],
  }
}

mysqldb { "live":
  user => "live",
  password => "",
}

mysqldb { "i3omdb_unittest":
  user => "live",
  password => "",
}

mysqldb { "I3OmDb_test":
  user => "live",
  password => "",
}

# file { "/etc/sysconfig/iptables":
#   owner => "root",
#   mode => 0600,
#   content => "# Firewall configuration written by vagrant-i3live
# # Manual customization of this file is not recommended.
# *filter
# :INPUT ACCEPT [0:0]
# :FORWARD ACCEPT [0:0]
# :OUTPUT ACCEPT [0:0]
# -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
# -A INPUT -p icmp -j ACCEPT
# -A INPUT -i lo -j ACCEPT
# -A INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT
# -A INPUT -p tcp -m tcp --dport 8000 -j ACCEPT
# -A INPUT -j REJECT --reject-with icmp-host-prohibited
# -A FORWARD -j REJECT --reject-with icmp-host-prohibited
# COMMIT
# "
# }

# We turn off iptables for now; FIXME: use iptable Puppet modules to open Port 8000 only.
service { 'iptables':
  ensure => stopped,
#  enable => false,
#  require => File["/etc/sysconfig/iptables"]
}

import 'python'

class { 'python':
  version    => 'system',
  dev        => true,
  virtualenv => true,
}

python::virtualenv { '/home/vagrant/venv':
  ensure       => present,
  version      => 'system',
  systempkgs   => true,
  distribute   => false,
  owner        => 'vagrant',
  group        => 'admin',
  cwd          => '/tmp',
}

python::pip { 'Django==1.4': virtualenv => '/home/vagrant/venv', owner => 'vagrant' }
python::pip { 'MySQL-python': virtualenv => '/home/vagrant/venv', owner => 'vagrant' }
python::pip { 'South': virtualenv => '/home/vagrant/venv', owner => 'vagrant' }
python::pip { 'argparse': virtualenv => '/home/vagrant/venv', owner => 'vagrant' }
python::pip { 'colorama': virtualenv => '/home/vagrant/venv', owner => 'vagrant' }
python::pip { 'fabric': virtualenv => '/home/vagrant/venv', owner => 'vagrant' }
python::pip { 'lxml': virtualenv => '/home/vagrant/venv', owner => 'vagrant' }
python::pip { 'nose': virtualenv => '/home/vagrant/venv', owner => 'vagrant' }
python::pip { 'numpy': virtualenv => '/home/vagrant/venv', owner => 'vagrant' }
python::pip { 'ordereddict': virtualenv => '/home/vagrant/venv', owner => 'vagrant' }
python::pip { 'pep8==0.6.1': virtualenv => '/home/vagrant/venv', owner => 'vagrant' }
python::pip { 'pyephem': virtualenv => '/home/vagrant/venv', owner => 'vagrant' }
python::pip { 'pycrypto': virtualenv => '/home/vagrant/venv', owner => 'vagrant' }
python::pip { 'pymongo': virtualenv => '/home/vagrant/venv', owner => 'vagrant' }
python::pip { 'python-twitter': virtualenv => '/home/vagrant/venv', owner => 'vagrant' }
python::pip { 'pyzmq==2.2.0.1': virtualenv => '/home/vagrant/venv', owner => 'vagrant' }
#python::pip { 'scipy': virtualenv => '/home/vagrant/venv', owner => 'vagrant' }
python::pip { 'simplejson': virtualenv => '/home/vagrant/venv', owner => 'vagrant' }
python::pip { 'conttest': virtualenv => '/home/vagrant/venv', owner => 'vagrant' }
python::pip { 'textile': virtualenv => '/home/vagrant/venv', owner => 'vagrant' }
python::pip { 'toolz': virtualenv => '/home/vagrant/venv', owner => 'vagrant' }
