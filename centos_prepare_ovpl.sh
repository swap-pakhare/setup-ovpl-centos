#!/bin/bash
# Script to setup a fresh installation of CentOS to run OVPL
# Installs: Dependencies: python-devel, git, pip; mongodb; openvz.

# check if script is run as root
if [[ $UID -ne 0 ]]; then
  echo "$0 must be run as root!"
  echo "Exiting.."
  exit 1
fi

# check if meta directory exists
if [[ ! -d "./meta" ]]; then
  echo "You don't have the meta directory."
  echo "Please ask any co-ordinator to provide you the meta directory, and "
  echo "place it in this directory."
  exit 1
fi

export http_proxy="http://proxy.iiit.ac.in:8080"
export https_proxy="http://proxy.iiit.ac.in:8080"

./install_dependencies.sh
if [ $? -ne 0 ]; then
  echo "Error installing dependencies. Quitting!"
  exit 1
fi

./install_openvz.sh
if [ $? -ne 0 ]; then
  echo "Error installing OpenVZ. Quitting!"
  exit 1
fi

./install_mongodb.sh
if [ $? -ne 0 ]; then
  echo "Error installing MongoDB. Quitting!"
  exit 1
fi

./install_ovpl.sh
if [ $? -ne 0 ]; then
  echo "Error installing OVPL. Quitting!"
  exit 1
fi

unset http_proxy
unset https_proxy

exit 0
