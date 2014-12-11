#!/bin/bash

meta_dir="../meta"

echo ""
echo "Install RPM FORGE REPOSITORY.."
rpm -ivh $meta_dir/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
rpm --import http://apt.sw.be/RPM-GPG-KEY.dag.txt
mv /etc/yum.repos.d/rpmforge.repo /etc/yum.repos.d/rpmforge.repo_disabled
cp -f $meta_dir/rpmforge.repo.rpmsave /etc/yum.repos.d/rpmforge.repo


echo ""
echo "Upgrade GIT"
yum update -y git
echo "Git update done .."
exit 0
