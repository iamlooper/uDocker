#!/bin/bash

# Build essentials
sed -i.bak 's/us-west-2\.ec2\.//' /etc/apt/sources.list
apt -qq update
apt -qq upgrade -y
apt -qq install -y --no-install-recommends \
  apt-utils apt-transport-https \
  curl \
  git \
  gnupg2 \
  wget \
  unzip \
  tree \
  gcc g++ g++-multilib gcc-multilib clang cmake \
  python3-dev \ 
  zlib1g-dev \
  build-essential coreutils jq pv \
  ffmpeg mediainfo \
  neofetch \
  p7zip-full \
  libfreetype6-dev libjpeg-dev libpng-dev libgif-dev libwebp-dev

# Chrome drivers
mkdir -p /tmp/ && cd /tmp/
wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i ./google-chrome-stable_current_amd64.deb
apt -fqqy install
wget -q http://chromedriver.storage.googleapis.com/$(curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE)/chromedriver_linux64.zip
unzip chromedriver_linux64.zip chromedriver -d /usr/bin/
rm -rf chromedriver_linux64.zip && rm -rf google-chrome-stable_current_amd64.deb
rm -rf /var/lib/apt/lists /var/cache/apt/archives /tmp/*

# PIP
pip install --upgrade pip
pip install --upgrade setuptools