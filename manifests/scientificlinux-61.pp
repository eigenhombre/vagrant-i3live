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

package { 'mongodb': ensure => installed }

package { 'mongodb-devel': ensure => installed }

package { 'mongodb-server': ensure => installed }

service { 'mongod':
  enable => true,
  ensure => running,
  require => Package["mongodb-server"]
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
