#!/bin/bash

echo ""
echo "Fetching OVPL from GitHub.."
cd /root
git clone https://github.com/vlead/ovpl.git

echo ""
echo "Installing OVPL.."
cd ovpl
python setup.py install

echo ""
echo "Congrats! You have setup OVPL successfully!!! :-)"
echo "Now run 'make' from inside the src directory"
echo " of OVPL to start the services."

exit 0
