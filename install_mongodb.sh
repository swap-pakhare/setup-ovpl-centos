#!/bin/bash
# Script to setup repo and install MongoDB

meta_dir="./meta"

export http_proxy="proxy.iiit.ac.in:8080"
export https_proxy="proxy.iiit.ac.in:8080"

echo "Setting up MongoDB repo.."
cp $meta_dir/mongodb.repo /etc/yum.repos.d/mongodb.repo

#yum -y update

echo "Installing MongoDB.."
yum -y install mongodb-org

echo "Starting mongod service.."
service mongod start

exit 0
