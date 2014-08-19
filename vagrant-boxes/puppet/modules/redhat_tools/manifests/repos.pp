class redhat_tools::repos {
  case $operatingsystem {
    'CentOS', 'RedHat': {
      if $operatingsystemrelease =~ /^6.*/ {
        notify{"Your running version 6 of CentOS":}
        ->
        exec {"/usr/bin/wget http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm":
          cwd   => '/tmp/puppet-stuff',
          require => File['/tmp/puppet-stuff'],
        }
        ->
        exec {"/bin/rpm -U epel-release-6-8.noarch.rpm":
          cwd	=>	'/tmp/puppet-stuff',
          logoutput	=>	'on_failure',
        }
        ->
        exec {"/usr/bin/yum -y update":
          timeout => 1000,
        }
      }

      if $operatingsystemrelease =~ /^5.*/ {
        notify{"Your running version 5 of Centos":}
        ->
        exec {"/usr/bin/wget http://dl.fedoraproject.org/pub/epel/5/i386/epel-release-5-4.noarch.rpm":
          cwd	=>	'/tmp/puppet-stuff',
          require	=>	File['/tmp/puppet-stuff'],
        }
        ->
        exec {"/bin/rpm -U epel-release-5-4.noarch.rpm":
          cwd	=>	'/tmp/puppet-stuff',
          logoutput	=>	'true',
        }
        ->
        exec {"/usr/bin/yum -y update":
          timeout => 1000
        }
      }

      if $operatingsystemrelease =~ /^[1-4].*/ {
        notify{"Your operating system is too old":}
      }
    }
    default: {
      notify{"There are not repositories to add since your not on CentOS/RedHat":}
    }
  }
}
