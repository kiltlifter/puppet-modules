class security::ssh {
  
  package {"openssh-server":
    ensure  =>  "installed",
  }
  ->
  exec {"disable-root-login":
    command => "/bin/sed -ri 's/(^#|^P|.).*RootLogin\s*(yes|no)/PermitRootLogin no/g' /etc/ssh/sshd_config",
    require => Package["openssh-server"],
  }
  
  case $osfamily {
    'RedHat': {
      service {"sshd": 
        ensure  => "running",
        enable => true,
        require =>  Package["openssh-server"],
      }
    }
    default: {
      service {"ssh": 
        ensure  => "running",
        enable => true,
        require =>  Package["openssh-server"],
      }
    }
}
