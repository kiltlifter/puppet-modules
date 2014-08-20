class redhat_tools::utilities {

  if $osfamily == "Redhat" {
    notify{"Installing Development tools for RedHat Systems":}
    ->
    package {"rpm-build":
      ensure => "present",
    }

    package {"rpmdevtools":
      ensure => "present",
    }

    package {"mock":
      ensure => "present",
    }

    package {"redhat-rpm-config":
      ensure => "present",
    }

    package {"git":
      ensure => "present",
    }

    package {"createrepo":
      ensure => "present",
    }
    
    package {"p7zip":
      ensure => "present",
    }

    package {"p7zip-plugins":
      ensure => "present",
    }
  }
}
