#!/bin/bash
# Script to setup repo and install MongoDB

meta_dir="./meta"

echo "Setting up MongoDB repo.."
cp $meta_dir/mongodb.repo /etc/yum.repos.d/mongodb.repo

#yum -y update

echo "Installing MongoDB.."
yum -y install mongodb-org

exit 0
