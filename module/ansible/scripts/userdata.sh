#!/bin/bash

# Install Ansible
yum update -y
yum install -y ansible

# Run Ansible playbook
ansible-playbook /path/to/playbook.yml
