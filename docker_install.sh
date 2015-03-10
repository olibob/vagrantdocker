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
# Specific to 1.1.0 TODO: change to latest! (2015-03-10)

curl -L https://github.com/docker/compose/releases/download/1.1.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Install docker machine
# Specific to 0.1.0 TODO: change to latest (2015-03-10)
curl -L https://github.com/docker/machine/releases/download/v0.1.0/docker-machine_linux-amd64 > /usr/local/bin/docker-machine
chmod +x /usr/local/bin/docker-machine
