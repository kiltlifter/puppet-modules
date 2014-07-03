class networking::analysis {
	case $osfamily {
	    "RedHat": {
	        package {
	            'wireshark.x86_64':
	                ensure      => installed,
	        }
	        package {
	            'nmap.x86_64':
	                ensure      => installed,
	        }
	        package {
	            'libpcap-devel.x86_64':
	                ensure      => installed,
	        }
	    }
	    default: {
	        package {
	            'wireshark':
	                ensure      => installed,
	        }
	        package {
	            'nmap':
	                ensure      => installed,
	        }
	        package {
	            'libpcap0.8-dev':
	                ensure      => installed,
	        }
	    }
	}
}