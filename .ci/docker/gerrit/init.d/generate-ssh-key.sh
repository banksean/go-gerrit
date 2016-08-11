#!/bin/bash -xe

mkdir -p /var/gerrit/.ssh/
ssh-keygen -t rsa -f /var/gerrit/.ssh/id_rsa -N ""
cp /var/gerrit/.ssh/id_rsa.pub /var/gerrit/.ssh/authorized_keys
chown -R gerrit2:gerrit2 /var/gerrit/.ssh/
chmod 700 /var/gerrit/.ssh/
chmod 600 /var/gerrit/.ssh/id_rsa
