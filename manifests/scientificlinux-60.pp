group { "puppet": ensure => "present", }

File { owner => 0, group => 0, mode => 0644 }

file { '/etc/motd': content => "Vagrant SL6.0 dev box\n" }

package { 'java-1.7.0-openjdk': ensure => installed }

package { 'java-1.7.0-openjdk-devel': ensure => installed }

package { 'wget': ensure => installed }

package { 'python-virtualenv': ensure => installed }

package { 'python-devel': ensure => installed }

package { 'zeromq': ensure => installed }

package { 'zeromq-devel': ensure => installed }

package { 'gcc': ensure => installed }

package { 'gcc-c++': ensure => installed }

package { 'nodejs': ensure => installed }

package { 'git': ensure => installed }

package { 'subversion': ensure => installed } 

package { 'mysql': ensure => installed }

service { 'mysqld':
  enable => true,
  ensure => running,
  require => Package["mysql-server"]
}

package { 'mysql-server': ensure => installed }

package { 'postgresql': ensure => installed }

package { 'postgresql-server': ensure => installed }

# Leiningen / Clojure

$user = 'vagrant'

file { "leiningen/create-local-bin-folder":
  ensure => directory,
  path => "/home/$user/bin",
  owner => $user,
  group => $user,
  mode => '755',
}

$lein_url = "https://github.com/technomancy/leiningen/raw/stable/bin/lein"

exec { "leiningen/install-script":
  user => $user,
  group => $user,
  path => ["/bin", "/usr/bin", "/usr/local/bin"],
  cwd => "/home/$user/bin",
  command => "wget ${lein_url} && chmod 755 lein",
  creates => ["/home/$user/bin/lein",
              "/home/$user/.lein"],
}

# Virtualenv for python

exec { "python/virtualenv":
  command => "/usr/bin/virtualenv /home/$user/venv",
  creates => ["/home/$user/venv"],
  user => $user,
}

