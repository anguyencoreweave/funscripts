#!/bin/bash

echo "---------------------------------------------"
echo "$(date): Starting i40e driver installation script"
echo "---------------------------------------------"

echo "$(date): Downloading i40e driver..."
sudo wget https://downloadmirror.intel.com/786085/i40e-2.23.17.tar.gz

echo "$(date): Extracting the tarball..."
sudo tar zxf i40e-2.23.17.tar.gz

echo "$(date): Navigating to the source directory..."
cd i40e-2.23.17/src

echo "$(date): Building and installing the driver..."
sudo make install

echo "$(date): Loading the i40e kernel module..."
sudo modprobe i40e

echo "$(date): Displaying information about the i40e module..."
sudo modinfo i40e

echo "---------------------------------------------"
echo "$(date): Installation and setup completed successfully."
echo "---------------------------------------------"
