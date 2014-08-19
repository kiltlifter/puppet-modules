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

    package {"git":
      ensure => "present",
      require => Class["redhat_tools::repos"],
    }

    package {"mkisofs":
      ensure => "present",
      require => Class["redhat_tools::repos"],
    }

    package {"createrepo":
      ensure => "present",
      require => Class["redhat_tools::repos"],
    }
    
    package {"p7zip":
      ensure => "present",
      require => Class["redhat_tools::repos"],
    }

    package {"p7zip-plugins":
      ensure => "present",
      require => Class["redhat_tools::repos"],
    }
  }
}
