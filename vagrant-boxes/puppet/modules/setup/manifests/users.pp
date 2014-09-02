class setup::users {
  
  user {"builder":
    ensure  => present,
    uid     => "555",
    gid     => "wheel",
    shell   => "/bin/bash",
    home    => "/home/builder",
    managehome => true,
  }
  ->
  file {"/home/builder/tools":
    ensure  => 'directory',
    owner   => 'builder',
    group   => 'wheel',
    mode    => 750,
  }
}
