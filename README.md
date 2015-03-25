What is it?
-----------

Scripts to setup [OVPL](https://github.com/vlead/ovpl)
on a fresh installation of CentOS.

It also installs the dependencies, OpenVZ and MongoDB.


Steps to run the scripts
-------

* *For installing OVPL, on a machine running ubuntu:*
  1. At the command prompt, login as root user using:
      ``` 
      sudo su
      ```
 
  2. Enter into the home directory for the root user:
      ``` 
      cd /root/
      ```

  3. Clone the ```setup-ovpl-centos``` repository from github:
      ```       
      git clone https://github.com/vlead/setup-ovpl-centos.git 
      ```
      
  4. Enter into the newly cloned directory:
      ```       
      cd setup-ovpl-centos/
      ```

  5. Checkout the  ```develop``` branch, that contains scripts for setup:
      ```      
       git checkout develop
      ```

  6. Change directory to ```scripts```:  
        ```
        cd scripts
        ```
  
  7. Edit the ```config.sh``` file in the ```scripts``` folder and put appropriate
  proxy settings in it. If there is no proxy to be set, leave it blank.

  8. Run the ```install_vagrant.sh``` script:     
        ```
        bash install_vagrant.sh
        ```

  9. As a result of this script, a folder ```centos``` with ```Vagrantfile``` is created at the home directory. 
   To configure virtual machine according to this Vagrantfile:
       ```       
       cd ../../centos/
       vagrant up
       ```
  
  10. Login as root user:
       ```
       sudo su
       ```

  11. SSH into running Vagrant machine:
        ```
        vagrant ssh
        ```

  12. Next step is to copy the ```setup-ovpl-centos``` folder from your local machine to vagrant vm(base machine). To achieve this, do an ```ifconfig``` on your base machine to get its ip-address.
  
  13. Now, open a new terminal on your local machine and copy ```setup-ovpl-centos``` to vagrant vm:
       ```
       scp -r /root/setup-ovpl-centos <username>@<ip-address-of your-base-machine>:<path-of-setup-ovpl-centos> 
       ```
       By default, the username and password of your vagrant vm is set to ```vagrant```

  14. Run the ```centos_prepare_ovpl.sh``` script from *vagrant vm* as a root user. This sets up OVPL and all its      dependencies successfully:
       ```       
       bash centos_prepare_ovpl.sh
       ```

  15. For starting the OVPL services, follow the steps below:
       ```       
       cd /root/ovpl/src/
       make
       ```

* *For installing OVPL, on a machine running centos:*

 1. At the command prompt, login as root user using:
      ``` 
      sudo su
      ```
 
  2. Enter into the home directory for the root user:
      ``` 
      cd /root/
      ```

  3. Clone the ```setup-ovpl-centos``` repository from github:
      ```       
      git clone https://github.com/vlead/setup-ovpl-centos.git 
      ```
      
  4. Edit the ```config.sh``` file in the ```scripts``` folder and put appropriate
  proxy settings in it. If there is no proxy to be set, leave it blank.
       ```       
      cd setup-ovpl-centos/scripts/
       ```

  5. Run the ```centos_prepare_ovpl.sh``` script as a root user. This sets up OVPL and all its dependencies successfully:
       ```       
       bash centos_prepare_ovpl.sh
       ```

  6. For starting the OVPL services, follow the steps below:
       ```       
       cd /root/ovpl/src/
       make
       ```       
       
