class editors::vim{

  if $osfamily == 'RedHat' {

    if $operatingsystem == "Fedora" {
      package {"vim-minimal.x86_64":
        ensure => "absent",
      }
    }

    package {'vim-enhanced.x86_64':
      ensure => "present",
    }
  }


  if $osfamily == 'Debian' {

    package{"vim":
      ensure => "present",
    }

  }
}
