#!/bin/bash
cd /home
mkdir ads
cd ads
wget https://github.com/vlead/setup-ovpl-centos/archive/master.zip
unzip master.zip
cd setup-ovpl-centos-master
make
