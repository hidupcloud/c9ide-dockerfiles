#!/bin/bash

# Doing this in a separate script lets us do it step by step while using a
# single docker layer.

# Install dependencies
yum install -y epel-release
yum install -y \
    curl \
    ansible \
    tar \
    which

# Ansible deployment
cd /tmp
curl -sSL https://github.com/gbraad/ansible-playbooks/raw/master/playbooks/install-c9sdk.yml -o install.yml
ansible-playbook install.yml

# Clean up
yum clean all
