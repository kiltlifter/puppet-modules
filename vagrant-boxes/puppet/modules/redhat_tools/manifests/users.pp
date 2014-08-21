class redhat_tools::users {
  
  user {"builder":
    ensure  => present,
    gid     => "mock",
    shell   => "/bin/bash",
    home    => "/home/builder",
    managehome => true,
  }

}
