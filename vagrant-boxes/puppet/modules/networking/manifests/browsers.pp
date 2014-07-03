class networking::browsers {
	case $osfamily {
	    "RedHat": {
	        # code
	    }
	    default: {
	        package {
	            'google-chrome-stable':
	                ensure      => installed,
	        }
	    }
	}
}