#!/bin/bash
# Author: OpenAI Chatbot
# Date: June 26, 2023
# This script updates the SSH config with running Vagrant hosts.

# This script fetches all running vagrant machines, creates SSH
# configs for them and adds them to
# ~/.ssh/config.d/vagrant_running_hosts. If a machine with the same
# name already exists, a number is appended to its name.

CONFIG_DIR="${HOME}/.ssh/config.d"
CONFIG_FILE="${CONFIG_DIR}/vagrant_running_hosts"

# Ensure the config directory exists
mkdir -p "${CONFIG_DIR}"

# Initialize or clear the config file
echo "" > "${CONFIG_FILE}"

# Fetch running vagrant machines and process each line
vagrant global-status --prune \
  | awk '/running/{print $1,$2}' \
  | while read -r VM_HASH VM_NAME; do
    COUNT=1
    ORIG_NAME="${VM_NAME}"
    
    # Append a number if a host with the same name exists
    while grep -q "Host ${VM_NAME}" "${CONFIG_FILE}"; do
        VM_NAME="${ORIG_NAME}${COUNT}"
        ((COUNT++))
    done

    # Generate and append the ssh config
    vagrant ssh-config "${VM_HASH}" \
      | sed "s/Host default/Host ${VM_NAME}/" \
            >> "${CONFIG_FILE}"
done

