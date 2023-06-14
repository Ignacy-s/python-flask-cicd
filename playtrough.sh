#!/bin/bash

# General script for the whole project.
# It runs all project's tasks one by one.
# Requisite: Script is run in the project's root directory else there
# will be fun.


# VARIABLES
# File that marks the root dir of the project
ROOT_DIR_MARKER=".flask-ci-cd-project-root-marker"
# File that marks the ssh-key vault
VAULT_ACCESS_MARKER=".ssh-vault-marker"
VAULT_LOCATION="vault/my_ssh_key_mount"
SSH_KEY_NAME="id_25519_aws_flaskcicd"

# FUNCTIONS
function usage() {
cat <<EOF >&2
Usage: ${0} X [Y]
Where X is the step you want to start at (0 to start from the
beginning), and Y is the step you want to end with. Y is optional, if
not submitted, the script will run until the end.
EOF
}

function die() {
  # Exit with a message.
  MESSAGE="${*}"
  echo -e "${MESSAGE}" >&2
  echo "Critical error in step $STEP, exiting ${0}."
  exit 1
}


# MAIN FUNCTION
main() {

  # Check if script was started in the project root dir
  if [[ ! -f "${ROOT_DIR_MARKER}" ]]; then
    die "Either script wasn't started in project's root dir,\n\
or the file ${ROOT_DIR_MARKER} is missing.\n\
Please start the script from inside the project's root."
  fi

  if (( ${#} < 1 )); then
    die "You didn't provide the starting step argument."
  fi
  
  START_POINT="${1}"
  LAST_POINT="${2:-999}"


  STEP=1
  # Prompt user for the vault password (if it's not defined yet)
  if [[ ( START_POINT -le STEP ) && ( LAST_POINT -ge STEP ) ]]; then
    echo "Performing step ${STEP}."
    # Only if variable is undefined/empty.
    if [[ -z "${VAULT_PASSPHRASE}" ]]; then
      read -s -p \
           'Enter the vault password: [input will remain hidden]' \
           VAULT_PASSPHRASE
      export VAULT_PASSPHRASE
      echo
    fi
    # Fail if it didn't work and we still don't have a password
    if [[ -z "${VAULT_PASSPHRASE}" ]]; then
      die "Failed to obtain a password for vault."
    else
      echo "Vault password obtained successfully." >&2
    fi
  fi

  STEP=2
  # Create and/or open a vault
  #TODO For now there will be an error if we try to re-create a vault
  #or open an existing vault if it's already open.
  if [[ ( START_POINT -le STEP ) && ( LAST_POINT -ge STEP ) ]]; then
    echo "Performing step ${STEP}."
    echo "Opening and creating a LUKS container takes a while." >&2
    # Inform the user about why the script prompts him for his
    # password, only if there is no sudo password cached
    if ! sudo -n true 2>/dev/null; then
      cat <<EOF >&2
This script needs sudo privileges to mount containers or to use
the cryptsetup binary.
EOF
    fi
    # Try to open the vault (but we don't mind if it fails)
    bin/vault_management.sh open &>/dev/null
    # Check if we can access the vault access mark
    if [[ ! -f "${VAULT_LOCATION}/${VAULT_ACCESS_MARKER}" ]]; then
      # Create a vault
      bin/vault_management.sh create &>/dev/null || die
      # Open the vault
      bin/vault_management.sh open &>/dev/null || die
      # Put a mark in it
      touch "${VAULT_LOCATION}/${VAULT_ACCESS_MARKER}"
      # Test if we can access the vault access mark
      if [[ ! -f "${VAULT_LOCATION}/${VAULT_ACCESS_MARKER}" ]]; then
        die "I tried, but I couldn't get the vault to work."
      fi
    fi
    echo "Vault access confirmed." >&2
  fi

  STEP=3
  # Generate an SSH key for the project (if it doesn't exist)
  if [[ ( START_POINT -le STEP ) && ( LAST_POINT -ge STEP ) ]]; then
    echo "Performing step ${STEP}."
    # Check if the key doesn't already exist
    if [[ -f "${VAULT_LOCATION}/${SSH_KEY_NAME}" ]]; then
      echo "Key ${SSH_KEY_NAME} already exists."
    else
      ssh-keygen -t ed25519 \
                 -C "AWS SSH key for flask-ci-cd project" \
                 -f "${VAULT_LOCATION}/${SSH_KEY_NAME}" \
                 -N "" \
        || die "Failed to generate an SSH key."
    fi
  fi

  STEP=4
  # Upload the key to AWS
  if [[ ( START_POINT -le STEP ) && ( LAST_POINT -ge STEP ) ]]; then
    echo "Performing step ${STEP}."
  fi

  STEP=5
  # Ask user for the region, instance type, inform about defaults
  if [[ ( START_POINT -le STEP ) && ( LAST_POINT -ge STEP ) ]]; then
    echo "Performing step ${STEP}."
  fi

  STEP=6
  # Set up a VM on AWS using Terraform
  if [[ ( START_POINT -le STEP ) && ( LAST_POINT -ge STEP ) ]]; then
    echo "Performing step ${STEP}."
  fi

  STEP=7
  # Test that VM works
  if [[ ( START_POINT -le STEP ) && ( LAST_POINT -ge STEP ) ]]; then
    echo "Performing step ${STEP}."
  fi

  STEP=8
  # Provision the VM for operations in preparation for Jenkins
  # installation
  if [[ ( START_POINT -le STEP ) && ( LAST_POINT -ge STEP ) ]]; then
    echo "Performing step ${STEP}."
  fi

  STEP=9
  # Install Jenkins on the VM
  if [[ ( START_POINT -le STEP ) && ( LAST_POINT -ge STEP ) ]]; then
    echo "Performing step ${STEP}."
  fi

  STEP=10
  # Configure Jenkins on the VM
  if [[ ( START_POINT -le STEP ) && ( LAST_POINT -ge STEP ) ]]; then
    echo "Performing step ${STEP}."
  fi

  STEP=11
  # Have Jenkins deploy the app container to AWS
  if [[ ( START_POINT -le STEP ) && ( LAST_POINT -ge STEP ) ]]; then
    echo "Performing step ${STEP}."
  fi

  STEP=12
  # Commit a change to the project's code repo (modify code of the app)
  if [[ ( START_POINT -le STEP ) && ( LAST_POINT -ge STEP ) ]]; then
    echo "Performing step ${STEP}."
  fi

  STEP=13
  # Confirm that Jenkins pushed the new version of the app's container to
  # the cloud.
  if [[ ( START_POINT -le STEP ) && ( LAST_POINT -ge STEP ) ]]; then
    echo "Performing step ${STEP}."
  fi

  # Congratulations, it works!
  return 0
}

main "${@}"
exit ${?}
