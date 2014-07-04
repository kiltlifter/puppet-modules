class development::java {
	$rpm_file	= 'jdk-7u60-linux-x64.rpm'
	$source_folder	= 'jdk-7u60-linux-x64.tar.gz'

	case $osfamily {
	    "RedHat": {
	    	exec {"/usr/bin/wget https://dl.dropboxusercontent.com/u/23508972/jdk-7u60-linux-x64.rpm":
	    		cwd		=> '/tmp/puppet-stuff',
	    		require	=>	File['/tmp/puppet-stuff'],
	    	}
	    	->
	        exec {
	            "/bin/rpm -U ${rpm_file}":
	            	cwd			=>	'/tmp/puppet-stuff',
	                logoutput   => on_failure,
	        }
	    }
	    default: {
	        file {
	            '/usr/java':
	                ensure  => directory,
	                owner   => 'root',
	                group   => 'root',
	                mode    => '0755',
	        }
	        exec {
	            "/usr/bin/wget https://dl.dropboxusercontent.com/u/23508972/jdk-7u60-linux-x64.tar.gz":
	            	cwd			=>	'/usr/java',
	                logoutput   => on_failure,
	               	require		=>	File['/usr/java'],
	        }
	        ->
	        exec {
	            "/bin/tar xzf ${source_folder}":
	            	cwd			=>	'/usr/java',
	                logoutput   => on_failure,
	                require		=>	File['/usr/java'],
	        }
	        ->
	        exec {
	            "/bin/rm -f ${source_folder}":
	                cwd			=>	'/usr/java',
	                logoutput   => on_failure,
	                require		=>	File['/usr/java'],
	        }	        
	    }
	}
}