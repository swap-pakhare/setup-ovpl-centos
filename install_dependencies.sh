#!/bin/bash

meta_dir="./meta"
ssh_file="~/.ssh/config"

echo "Setting up EPEL repo.."
#wget http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
rpm -ivh $meta_dir/epel-release-6-8.noarch.rpm

#echo "Updating yum cache.."
#yum -y update

echo "Installing dependencies.."
yum -y install gcc python-devel.x86_64 python-pip git

echo "Setting up ssh over HTTP.."
cd $meta_dir/corkscrew-2.0
echo "Installing corkscrew.."
./configure
make
make install

path_to_corkscrew=$(which corkscrew)

echo "Updating ssh config file.."
echo "" >> $ssh_file
echo "host github.com" >> $ssh_file
echo "ProxyCommand $path_to_corkscrew proxy.iiit.ac.in 8080 %h %p" >> $ssh_file

exit 0
