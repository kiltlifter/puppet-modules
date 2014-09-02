class setup {
  include setup::puppet_dir
  include setup::users  
  if $osfamily == "RedHat" { 
    if ! defined(Package['epel-release']) {
      include setup::repos
    }
  }

}
