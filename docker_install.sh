#!/usr/bin/bash

# Install latest docker binary
cd /tmp
wget -c http://get.docker.io/builds/Linux/x86_64/docker-latest.tgz
tar xzf /tmp/docker-latest.tgz -C /

# Install docker service
# Download the required files from https://github.com/docker/docker/tree/master/contrib/init/systemd to your Vagrant directory

SERVICE_DIR="/etc/systemd/system"
cp /vagrant/docker.service $SERVICE_DIR
cp /vagrant/docker.socket $SERVICE_DIR
systemctl enable docker.service
systemctl start docker.service

# Allow vagrant user to execute docker commands

groupadd docker
chown root:docker /var/run/docker.sock
usermod -a -G docker vagrant

# Install docker compose
# Specific to 1.1.0 TODO: change to latest!

curl -L https://github.com/docker/compose/releases/download/1.1.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
