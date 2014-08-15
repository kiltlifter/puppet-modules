class security::sudo {

  ## It doesn't seem like Fedora comes with sudo installed... Maybe because it was a vagrant box.
  if $operatingsystem == "Fedora" {
    package {"sudo":
      ensure  => "present",
    }
  }


}
