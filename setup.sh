#!/bin/bash

# Install Dependencies
apt update && apt install -y wget gnupg curl 

# Install MongoDB:
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg --dearmor
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-7.0.list

# Install UniFi:
apt-get update && apt-get install ca-certificates apt-transport-https -y
echo "deb [ arch=amd64,arm64 ] https://www.ui.com/downloads/unifi/debian stable ubiquiti" | tee /etc/apt/sources.list.d/100-ubnt-unifi.list

cd /etc/apt/trusted.gpg.d
wget -q -O /etc/apt/trusted.gpg.d/unifi-repo.gpg https://dl.ui.com/unifi/unifi-repo.gpg

apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install unifi -y

service unifi start