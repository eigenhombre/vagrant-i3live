group { "puppet":
  ensure => "present",
}

File { owner => 0, group => 0, mode => 0644 }

file { '/etc/motd':
  content => "Vagrant SL6.0 dev box\n"
}

package { 'java-1.7.0-openjdk':
  ensure => '1.7.0.19-2.3.9.1.el6_4',
}

package { 'java-1.7.0-openjdk-devel':
  ensure => '1.7.0.19-2.3.9.1.el6_4',
}

