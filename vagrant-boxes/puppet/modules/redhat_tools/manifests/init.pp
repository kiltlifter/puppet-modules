class redhat_tools {
	if $osfamily == "RedHat" {
    include redhat_tools::utilities
  }
}
