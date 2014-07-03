import 'base_variables.pp'

include editors
include networking

file {
    '/tmp/puppet-stuff':
        ensure  => directory,
        owner   => 'root',
        group   => 'root',
        mode    => '0644';
}