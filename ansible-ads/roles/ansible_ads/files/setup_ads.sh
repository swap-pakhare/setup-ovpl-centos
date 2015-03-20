#!/bin/bash
cd /home/ads/setup-ovpl-centos-master/build/scripts
export no_proxy="http://community.virtual-labs.ac.in/downloads/"
wget -O ../meta/ubuntu-12.04-custom-x86_64.tar.gz community.virtual-labs.ac.in/downloads/ubuntu-12.04-custom-x86_64.tar.gz
sh centos_prepare_ovpl.sh >> temp
