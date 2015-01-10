#!/usr/bin/bash

# Install latest docker binary
cd /tmp
wget -c http://get.docker.io/builds/Linux/x86_64/docker-latest.tgz
tar xzf /tmp/docker-latest.tgz -C /

# Install docker service
# Download the required files from https://github.com/docker/docker/tree/master/contrib/init/systemd to your Vagrant directory

SERVICE_DIR="/etc/systemd/system"
cp /vagrant/docker.service $SERVICE_DIR
chmod +x $SERVICE_DIR/docker.service
cp /vagrant/docker.socket $SERVICE_DIR
systemctl enable docker.service
systemctl start docker.service