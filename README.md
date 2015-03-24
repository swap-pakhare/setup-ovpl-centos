What is it?
-----------

Scripts to setup [OVPL](https://github.com/vlead/ovpl)
on a fresh installation of CentOS.

It installs the dependencies, OpenVZ and MongoDB.


Pre-requisite
-------------

- Edit the ```config.sh``` file in the ```scripts``` folder and put appropriate
  proxy settings in it. If there is no proxy to be set, leave it blank.


Steps to run the scripts
-------

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

5. Checkout the  ```vagrant-setup``` branch, that contains scripts for setup:
      ```      
       git checkout vagrant-setup
      ```

6. Change directory to ```scripts```:  
        ```
        cd scripts
        ```

7. Run the ```install_vagrant.sh``` script:     
        ```
        bash install_vagrant.sh
        ```

8. As a result of this script, a folder ```centos``` with ```Vagrantfile``` is created at the home directory. 
   To configure virtual machine according to this Vagrantfile:
       ```       
       cd ../../centos/
       vagrant up
       ```
  
9. SSH into running Vagrant machine:
        ```
        vagrant ssh
        ```

10. From your local machine, copy the ```scripts``` of ```setup-ovpl-centos``` to vagrant vm:
       ```
       rysnc -a --progress <username>:<ip-address-of your-base-machine>:<path-of-setup-ovpl-cento> /root/
       ```

11. Run the ```centos_prepare_ovpl.sh``` script from *vagrant vm* as a root user. This sets up OVPL and all its dependencies successfully:
       ```       
       bash centos_prepare_ovpl.sh
       ```

12. To run OVPL, follow the steps below:
       ```       
       cd /root/ovpl/src/
       make
       ```


