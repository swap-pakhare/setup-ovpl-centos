#!/bin/bash
# Script to setup a fresh installation of CentOS to run OVPL
# Installs: Dependencies: python-devel, git, pip; mongodb; openvz.

# check if script is run as root
if [[ $UID -ne 0 ]]; then
  echo ""
  echo "$0 must be run as root!"
  echo "Exiting.."
  exit 1
fi

# check if meta directory exists
if [[ ! -d "../meta" ]]; then
  echo ""
  echo "You don't have the necessary files."
  echo "Please contact the author of the script."
  exit 1
fi

# read proxy settings from config file
source ./config.sh

if [[ -n $http_proxy ]]; then
  echo $http_proxy
  export http_proxy=$http_proxy
fi
if [[ -n $https_proxy ]]; then
  export https_proxy=$https_proxy
fi

echo "Install Virtual Box and Vagrant"
./install_vagrant.sh
if [$? -ne 0 ]; then
  echo ""
  echo "Error installing GIT. Quitting!"
  exit 1
fi

#Create the guest machine
#Edit the Vagrantfile in the meta directory to choose the box.
vagrant up
if [$? -ne 0 ]; then
  echo ""
  echo "Error installing GIT. Quitting!"
  exit 1
fi


exit 0
