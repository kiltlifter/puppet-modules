class editors {
	notify{"$operatingsystem":}
	->
	file {
    '/tmp/puppet-stuff':
        ensure  => directory,
        owner   => 'root',
        group   => 'root',
        mode    => '0644'
	}
	->	
	case $operatingsystem {
		'Windows': {
			notify {"You are using windows. Functionality not supported.":}
		}
		'CentOS', 'RedHat': {
			exec {"/usr/bin/wget -O sublime.tar.bz2 http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.2%20x64.tar.bz2":
				cwd		=> '/tmp/puppet-stuff',
			}
			->
			exec {"/bin/tar xjf sublime.tar.bz2":
				cwd		=> '/tmp/puppet-stuff',
			}
			->
			exec {"/bin/rm -rf sublime.tar.bz2":
				cwd		=> '/tmp/puppet-stuff',
			}
			package {
			    'vim-enhanced.x86_64':
			        ensure      => installed,
			}
		}
		default: {
			exec {"/usr/bin/wget -O sublime.tar.bz2 http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.2%20x64.tar.bz2":
				cwd		=> '/tmp/puppet-stuff',
			}
			->
			exec {"/bin/tar xjf sublime.tar.bz2":
				cwd		=> '/tmp/puppet-stuff',
			}
			->
			exec {"/bin/rm -rf sublime.tar.bz2":
				cwd		=> '/tmp/puppet-stuff',
			}
			package {
			    'vim':
			        ensure      => installed,
			}
		}
	}
}
