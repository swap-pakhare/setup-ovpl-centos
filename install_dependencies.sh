#!/bin/bash

meta_dir="./meta"

echo "Setting up EPEL repo.."
#wget http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
rpm -ivh $meta_dir/epel-release-6-8.noarch.rpm

#echo "Updating yum cache.."
#yum -y update

echo "Installing dependencies.."
yum -y install gcc python-devel.x86_64 python-pip git

exit 0
