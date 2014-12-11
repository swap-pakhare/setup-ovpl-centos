What is it?
-----------

Scripts to setup [OVPL](https://github.com/vlead/ovpl)
on a fresh installation of CentOS.

It installs the dependencies, OpenVZ and MongoDB.


Pre-requisite
-------------

- Edit the ```config.sh``` file in the ```scripts``` folder and put appropriate
  proxy settings in it. If there is no proxy to be set, leave it blank.


Running
-------

To run, execute the script ```centos_prepare_ovpl.sh```


    $ ./centos_prepare_ovpl.sh

This is will install OVPL and all its dependencies.

After this completes, reboot the system to make sure you are booted into the
OpenVZ kernel.

Then, start the OVPL services by running the command
  $ make

from ```ovpl/src/``` directory
