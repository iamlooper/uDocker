#!/bin/bash

# Update and upgrade the system
apt update && apt upgrade -y

# Install essential tools
apt install -y \
    git \
    curl \
    wget \
    unzip \
    tar \
    build-essential \
    software-properties-common \
    apt-transport-https \
    ca-certificates \
    gnupg \
    lsb-release

# Install Python and pip
apt install -y python3-full python3-pip
ln -s /usr/bin/python3 /usr/bin/python

# Configure pip to allow installation in the system environment
mkdir -p ~/.config/pip
echo "[global]" > ~/.config/pip/pip.conf
echo "break-system-packages = true" >> ~/.config/pip/pip.conf

# Clean up
apt autoremove -y
apt clean
rm -rf /var/lib/apt/lists/*