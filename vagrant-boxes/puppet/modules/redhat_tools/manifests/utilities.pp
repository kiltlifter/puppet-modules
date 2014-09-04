class redhat_tools::utilities {

    package{[
        "rpm-build",
        "rpmdevtools",
        "mock",
        "redhat-rpm-config",
        "git",
        "createrepo",
        "p7zip",
        "p7zip-plugins",
        "gcc-c++",
        "byobu",
        "zlib-devel",
        "httpd",
        "httpd-devel",
        "apr-devel",
        "apr-util-devel",
        "libyaml",
        "postgresql",
        "postgresql-devel",
        "setools",
        "libsemanage",
        "libsemanage-devel",
        "setools-console",
        "setools-devel",
        "setools-libs",
        "policycoreutils-python",
      ]:
        ensure  => present;
    }   
}
