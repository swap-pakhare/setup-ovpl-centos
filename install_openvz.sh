#!/bin/bash
# Script to setup OpenVZ repo, install and configure OpenVZ

meta_dir="./meta"

echo "Setting up OpenVZ repo.."
#wget -P /etc/yum.repos.d/ http://ftp.openvz.org/openvz.repo
cp $meta_dir/openvz.repo /etc/yum.repos.d/openvz.repo
rpm --import http://ftp.openvz.org/RPM-GPG-Key-OpenVZ

yum -y update

echo "Installing the OpenVZ kernel.."
yum -y install vzkernel

echo "Configuring OpenVZ.."
cat $meta_dir/updated_sysctl.conf >> /etc/sysctl.conf
echo "SELINUX=disabled" > /etc/sysconfig/selinux

echo "Installing OpenVZ tools.."
yum -y install vzctl vzquota ploop vzstats

echo "Copying the default OS template for containers.."
cp $meta_dir/ubuntu-12.04-custom-x86_64.tar.gz /vz/template/cache


echo "Allowing multiple subnets to reside on the same network interface.."
sed -i 's/#NEIGHBOUR_DEVS=all/NEIGHBOUR_DEVS=all/g' /etc/vz/vz.conf
sed -i 's/NEIGHBOUR_DEVS=detect/NEIGHBOUR_DEVS=all/g' /etc/vz/vz.conf

echo "Setting container layout to default to ploop (VM in a file).."
sed -i 's/#VE_LAYOUT=ploop/VE_LAYOUT=ploop/g' /etc/vz/vz.conf

echo "Setting Ubuntu 12.04 64bit to be the default template.."
sed -i 's/centos-6-x86/ubuntu-12.04-x86_64/g' /etc/vz/vz.conf

sysctl -p

echo "Disabling iptables.."
/etc/init.d/iptables stop && chkconfig iptables off

echo "Finished installing OpenVZ "
exit 0
