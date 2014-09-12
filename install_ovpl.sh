#!/bin/bash

echo "Fetching OVPL from GitHub"
cd /root
git clone https://github.com/vlead/ovpl.git

echo "Installing OVPL.."
cd ovpl
python setup.py install

echo "Congrats! You have setup OVPL successfully!!! :-)"

exit 0
