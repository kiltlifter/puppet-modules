puppet-modules
==============

Collection of some pupput modules I've been working on.

# Setup

Change to the directory of the machine you would like to use:

`cd vagrant-boxes/centos-6.5-puppet`

Run start vagrant:

`vagrant up`

After it has finished downloading the image run:

`vagrant ssh`

Next switch to the root user and change to the /puppet folder:

`sudo su`
`cd /puppet`

Run the bootstrap script:

`bash bootstrap.sh`

Follow the prompts.

After puppet has completed you should have an adequate development environemnt ready
to go!
