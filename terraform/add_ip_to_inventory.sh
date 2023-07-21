#!/bin/bash

# Script to automatically add an IP address ($1) to the ansible
# inventory file.

# TODO:
# 1. move the '^jenkins ansible_host' string to a variable

# The first argument is the IP address
IP_ADDRESS="${1}"

# Path to your inventory file
INVENTORY_FILE="../ansible/hosts.ini"

# Use sed or awk to edit the file, inserting the IP address where needed
sed -i "/^jenkins ansible_host/s/\".*\"/\"${IP_ADDRESS}\"/g" "${INVENTORY_FILE}"

# Finished
exit 0
