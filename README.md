What is it?
-----------

Scripts to setup [OVPL](https://github.com/vlead/ovpl)
on a fresh installation of CentOS.

It installs dependencies, OpenVZ and MongoDB.


Pre-requisite
-------------

- Edit the config file and put appropriate proxy settings in it. If there is no
  proxy to be set, leave it blank.

- Obtain VZ template OS file(ubuntu-12.04-custom-x86_64.tar.gz) from [here](http://community.virtual-labs.ac.in/downloads/).
  Copy it in the ```meta``` folder in this directory.


Running
-------

To run, execute the script ```centos_prepare_ovpl.sh```


    $ ./centos_prepare_ovpl.sh

This is will install OVPL and all its dependencies.
After this completes, reboot the system to make sure you are booted into the
OpenVZ kernel.
Then, start the OVPL services by running make from ovpl/src/ directory
