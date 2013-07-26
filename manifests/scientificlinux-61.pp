group { "puppet": ensure => "present", }

File { owner => 0, group => 0, mode => 0644 }

file { '/etc/motd': content => "Vagrant SL6.1 dev box for IceCube Live\n" }

package { 'wget': ensure => installed }

package { 'python-virtualenv': ensure => installed }

package { 'python-devel': ensure => installed }

package { 'zeromq': ensure => installed }

package { 'zeromq-devel': ensure => installed }

package { 'gcc': ensure => installed }

package { 'gcc-c++': ensure => installed }

package { 'git': ensure => installed }

package { 'diffutils': ensure => installed }

package { 'mysql': ensure => installed }

service { 'mysqld':
  enable => true,
  ensure => running,
  require => Package["mysql-server"]
}

package { 'mysql-server': ensure => installed }

# Virtualenv for python

exec { "python/virtualenv":
  require => Package["python-virtualenv"],
  command => "/usr/bin/virtualenv /home/$user/venv",
  creates => ["/home/$user/venv"],
  user => $user,
}

