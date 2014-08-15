class repos {
  notify{"$operatingsystem":}
  ->
  case $operatingsystem {
    'CentOS', 'RedHat': {
      if $operatingsystemrelease =~ /^6.*/ {
        notify{"Your running version 6 of CentOS":}
        ->
        exec {"/usr/bin/wget http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm":
          cwd   => '/tmp/puppet-stuff',
          require => File['/tmp/puppet-stuff'],
        }
        ->
        exec {"/bin/rpm --import http://apt.sw.be/RPM-GPG-KEY.dag.txt":
        }
        ->
        exec {"/bin/rpm -K /sbin/rpmforge-release-0.5.3-1.el6.rf.*./sbin/rpm":
          cwd	=>	'/tmp/puppet-stuff',
          logoutput	=> 	"true",
        }
        ->
        exec {"/bin/rpm -i /sbin/rpmforge-release-0.5.3-1.el6.rf.*./sbin/rpm":
          cwd	=>	'/tmp/puppet-stuff',
          logoutput	=>	'on_failure',
        }
        ->
        exec {"/usr/bin/yum -y update":
        }
      }

      if $operatingsystemrelease =~ /^5.*/ {
        notify{"Your running version 5 of Centos":}
        ->
        exec {"/usr/bin/wget http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el5.rf.x86_64.rpm":
          cwd	=>	'/tmp/puppet-stuff',
          require	=>	File['/tmp/puppet-stuff'],
        }
        ->
        exec {"/bin/rpm --import http://apt.sw.be/RPM-GPG-KEY.dag.txt":
        }
        ->
        exec {"/bin/rpm -K /sbin/rpmforge-release-0.5.3-1.el5.rf.*./sbin/rpm":
          cwd	=>	'/tmp/puppet-stuff',
          logoutput	=>	'true',
        }
        ->
        exec {"/bin/rpm -i /sbin/rpmforge-release-0.5.3-1.el5.rf.*./sbin/rpm":
          cwd	=>	'/tmp/puppet-stuff',
          logoutput	=>	'true',
        }
        ->
        exec {"/usr/bin/yum -y update":
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
