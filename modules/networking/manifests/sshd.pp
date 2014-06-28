class networking::sshd {
	
	package {
	    'ssh':
	        ensure      => installed,
	}

	notify {
	    'ssh-installed':
	        message  => 'ssh has been installed',
	        withpath => true,
	        require  => Package['ssh'],
	}

	service {
	    'start-ssh':
	        ensure      => running,
	        enable      => true,
	        require     => Package['ssh'],
	}
}
