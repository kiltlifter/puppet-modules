class redhat_tools::utilities {
  
  if $osfamily == "Redhat" {
    notify{"Installing Development tools for RedHat Systems":}
    ->
    package {"rpm-build":
      ensure => "present",
	  require => Class["redhat_tools::repos"],
    }

    package {"rpmdevtools":
      ensure => "present",
	  require => Class["redhat_tools::repos"],
    }
	
	package {"mock":
      ensure => "present",
	  require => Class["redhat_tools::repos"],
    }

	package {"redhat-rpm-config":
      ensure => "present",
	  require => Class["redhat_tools::repos"],
    }
	
    package {"setools-libs.x86_64":
      ensure => "present",
	  require => Class["redhat_tools::repos"],
    }

    package {"setools-devel.x86_64":
      ensure => "present",
	  require => Class["redhat_tools::repos"],
    }
  }

}
