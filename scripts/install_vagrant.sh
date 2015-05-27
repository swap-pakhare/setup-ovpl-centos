#!/bin/bash

numFields=`pwd | awk -F'/' '{print NF-1}'`
setupDir=`pwd | cut -d'/' -f1-$numFields`

function echo_status
{
  if [ $1 -ne 0 ]; then
    echo ""
    echo "Error executing ( "$2" ). Quitting!"
    exit 1
  else
    echo "Successfully executed ( "$2" )."
  fi
}

echo $http_proxy
echo $https_proxy

#UnInstall Vagrant
echo "Uninstalling Vagrant"
rm -rf /opt/vagrant
rm -rf /usr/bin/vagrant
rm -rf "/root/VirtualBox VMs"
rm -rf /root/.vagrant
rm -rf /root/.vagrant.d
rm -rf /root/centos

#UnInstall virtual box
echo "Uninstalling virtual box"
apt-get remove -y virtualbox-4.3
apt-get -y autoremove
apt-get -y clean

#Add virtualbox source to /etc/apt/sources.list
source_list="deb http://download.virtualbox.org/virtualbox/debian trusty contrib"
sed -i '/virtualbox/d' /etc/apt/sources.list
echo $source_list >> /etc/apt/sources.list

#Download Oracle public key for apt-secure and add the key
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -

#Install Virtual Box 
echo "#Install Virtual Box "
sudo apt-get -y update
command="sudo apt-get install -y --force-yes virtualbox-4.3"
$command
echo_status $? "$command"
rm -rf oracle_vbox.asc

#Install Vagrant
echo "#Install Vagrant"
wget_command="wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.2_x86_64.deb"
echo "WGET : $wget_command"
$wget_command
echo_status $? "$wget_command"
command="dpkg -i vagrant_1.7.2_x86_64.deb"
$command
echo_status $? "$command"
rm -rf vagrant_1.7.2_x86_64.deb

cd /root/
mkdir centos
cd centos
rsync ${setupDir}/meta/Vagrantfile.save Vagrantfile
vagrant init chef/centos-6.5

exit 0
