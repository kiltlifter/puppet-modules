$BASE_PACKAGE_DIR         = "puppet-modules/vagrant-boxes"
$PROJECT_PATH             = "$BASE_PACKAGE_DIR/puppet"
$MODULE_PATH              = "$BASE_PACKAGE_DIR/puppet/modules"
$PUPPET_STUFF             = "/tmp/puppet-stuff"
$DEVELOPMENT_FILES		  =	"$MODULE_PATH/development/files"

stage { 'cleanup' : require => Stage['main'] }
