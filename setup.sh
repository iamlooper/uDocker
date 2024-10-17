#!/bin/bash

# Update the system
apk update && apk upgrade

# Install essential tools and dependencies
apk add --no-cache \
    git \
    curl \
    wget \
    unzip \
    tar \
    build-base \
    ca-certificates \
    gnupg \
    lsb-release \
    python3 \
    py3-pip \
    python3-dev \
    gcc \
    musl-dev

# Create a symbolic link for python3 to python
ln -sf /usr/bin/python3 /usr/bin/python

# Configure pip to allow installation in the system environment
mkdir -p ~/.config/pip
cat <<EOF > ~/.config/pip/pip.conf
[global]
break-system-packages = true
EOF

# Clean up APK cache to reduce image size
rm -rf /var/cache/apk/*