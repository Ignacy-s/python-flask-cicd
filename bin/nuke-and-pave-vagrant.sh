#!/bin/bash

# Quick one liner to nuke and pave Vagrant machines, remove them from
# known hosts and provision them with the ansible ssh key.

# Requirements:
# 1. Script to be run in /vagrant dir of the project!
# 2. The vault partition has to be open and accessible (the ssh key)


vagrant destroy -f \
  && vagrant up \
  && ssh-keygen -f "/home/igi/.ssh/known_hosts" -R "10.11.12.6" \
  && ssh-keygen -f "/home/igi/.ssh/known_hosts" -R "10.11.12.5" \
  && ../bin/copy-ssh-key-onto-machines.sh ../vault/id_25519_aws_flaskcicd.pub 
