class editors::sublimetext {
		
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
      		->
      		exec {"/bin/mv Sublime* /tmp":
        		cwd   => '/tmp/puppet-stuff',
      		}
      		->
      		notify{"Remember to move Sublime Text out of /tmp !!!":}

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
	      	->
	      	exec {"/bin/mv Sublime* /tmp":
	        	cwd   => '/tmp/puppet-stuff',
	      	}
	      	->
	      	notify{"Remember to move Sublime Text out of /tmp !!!":}

		}
	}
	
}
