class development::version_control {
	case $osfamily {
	    "RedHat": {
	    	package {
	            'subversion.x86_64':
	                ensure      => installed,
	        }
	    	package {
	            'git':
	                ensure      => installed,
	        }
	        package {
	            'screen.x86_64':
	                ensure      => installed,
	        }
	    }
	    default: {
	        package {
	            'git':
	                ensure      => installed,
	        }
	        package {
	            'subversion':
	                ensure      => installed,
	        }
	        package {
	        	'byobu':
	        		ensure		=> installed,
	        }
	    }
	}
}