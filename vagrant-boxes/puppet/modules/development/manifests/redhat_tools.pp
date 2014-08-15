class development::redhat_tools {
  
  if $operatingsystem == "Fedora" {
    notify{"Installing Development tools for Fedora":}
    ->
    package {"rpm-build.x86_64":
      ensure => "present",
    }

    package {"rpmdevtools.noarch":
      ensure => "present",
    }

    package {"setools-libs.x86_64":
      ensure => "present",
    }

    package {"setools-devel.x86_64":
      ensure => "present",
    }
  }

}
