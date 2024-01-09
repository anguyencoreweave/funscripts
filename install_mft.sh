#!/bin/bash

# Download and unpack Mellanox MFT
wget -O - https://www.mellanox.com/downloads/MFT/mft-4.26.1-3-x86_64-deb.tgz | tar -xzvf -

# Navigate to the extracted directory
cd mft-4.26.1-3-x86_64-deb

# Run the install.sh script with elevated privileges
sudo ./install.sh
