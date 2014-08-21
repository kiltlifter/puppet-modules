class setup {
  include setup::puppet_dir
  
  if $osfamily == "RedHat" { 
    if ! defined(Package['epel-release']) {
      include setup::repos
    }
  }

}
