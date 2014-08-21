class setup::puppet_dir {
  
  file {
    '/tmp/puppet-stuff':
        ensure  => directory,
        owner   => 'root',
        group   => 'root',
        mode    => '0644'
	}

}
