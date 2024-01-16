#!/bin/bash

# Display informational message
echo "This script is intended to upgrade ConnectX-3 10G Mellanox cards via the Ubuntu Server USB."

# Check if run by sudo
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with sudo."
    exit 1
fi

# Install required packages
echo "Installing required packages..."
sudo apt update
sudo apt install -y mstflint unzip

# Query the current firmware version
echo "Querying the current firmware version..."
sudo mstflint -d e1:00.0 q

# Download and unzip the firmware
echo "Downloading and unzipping the firmware..."
sudo wget http://www.mellanox.com/downloads/firmware/fw-ConnectX3-rel-2_42_5000-MCX311A-XCA_Ax-FlexBoot-3.4.752.bin.zip
sudo unzip fw-ConnectX3-rel-2_42_5000-MCX311A-XCA_Ax-FlexBoot-3.4.752.bin.zip

# Burn the firmware to the NIC
echo "Burning the firmware to the NIC..."
sudo mstflint -d e1:00.0 -i fw-ConnectX3-rel-2_42_5000-MCX311A-XCA_Ax-FlexBoot-3.4.752.bin burn

# Prompt user to enter 'y'
read -p "Please enter 'y' to confirm the firmware upgrade: " confirmation
if [ "$confirmation" != "y" ]; then
    echo "Firmware upgrade aborted by user."
    exit 1
fi

# Display success message
echo "Firmware upgrade successful. Please reboot your system and unplug the Linux Ubuntu Server USB."
