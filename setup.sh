#!/bin/bash

# Update the system
apt-get update && apt-get upgrade -y

# Install essential tools and dependencies
apt-get install -y --no-install-recommends \
    git \
    curl \
    wget \
    unzip \
    tar \
    build-essential \
    ca-certificates \
    gnupg \
    lsb-release \
    python3 \
    python3-pip \
    python3-dev \
    python-is-python3 \
    gcc

# Configure pip to allow installation in the system environment
mkdir -p ~/.config/pip
cat <<EOF > ~/.config/pip/pip.conf
[global]
break-system-packages = true
EOF

# Clean up APT cache to reduce image size
rm -rf /var/lib/apt/lists/*