class development::java_build_tools {
  
  $maven_ver = "apache-maven-3.2.3"
  $maven_url = "http://mirror.sdunix.com/apache/maven/maven-3/3.2.3/binaries/apache-maven-3.2.3-bin.tar.gz"
  $file_ext  = ".tar.gz"

  package {"ant":
    ensure => present,
    require => Class['development::java'],
  }

  exec {"/usr/bin/wget -O $PUPPET_STUFF/${maven_ver}.tar.gz ${maven_url}":
  }
  ->
  exec {"untar_maven":
    cwd => "$PUPPET_STUFF",
    command => "/bin/tar xzf ${maven_ver}${file_ext} -C /home/builder/tools",
  }
  ->
  exec {"/bin/chown -R builder:wheel /home/builder/tools/${maven_ver}":
  }
  ->
  exec {"/bin/echo 'MAVEN_HOME=/home/builder/tools/${maven_ver}' >> /etc/profile":
  }
  ->
  exec {"/bin/echo 'export PATH=\$PATH:/home/builder/tools/${maven_ver}/bin' >> /etc/profile":
  }

}
