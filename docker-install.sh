#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

# Update
apt update

# Remove old versions
apt remove docker docker-engine docker.io containerd runc

# Install
apt install docker.io

# Enable service
systemctl start docker
systemctl enable docker

docker --version

# Exec without sudo
usermod -aG docker ${USER}
su - ${USER}
id -nG
usermod -aG docker ${USER}
