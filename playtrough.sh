#!/bin/bash

# General script for the whole project.
# It runs all project's tasks one by one.
# Requisite: Script is run in the project's root directory else there
# will be fun.


# VARIABLES
VAULT_PASSPHRASE=""

# FUNCTIONS
function usage() {
cat <<EOF >&2
Usage: ${0} X[-Y]
Where X is the step you want to start at (0 to start from the
beginning), and Y is the step you want to end with. Y is optional, if
not submitted, the script will run until the end.
EOF
}


# MAIN FUNCTION
main(){

  if (( ${#} < 1 )); then
    die "You didn't provide the first step argument."
  fi
  
  START_POINT="${1}"
  LAST_POINT="${2:-999}"


  STEP=1
  # Prompt user for the vault password
  #TODO allow alternative, maybe read from file
  if [[ ( START_POINT -le STEP ) && ( LAST_POINT -ge STEP ) ]]; then
    read -s -p 'Enter the vault password: ' VAULT_PASSPHRASE
    export VAULT_PASSPHRASE
  fi

  STEP=2
  # Create and/or open a vault
  #TODO For now there will be an error if we try to re-create a vault or
  #open an existing vault if it's already open.
  if [[ ( START_POINT -le STEP ) && ( LAST_POINT -ge STEP ) ]]; then
    echo "Performing step ${STEP}."
  fi

  STEP=3
  # Generate an SSH key for the project
  if [[ ( START_POINT -le STEP ) && ( LAST_POINT -ge STEP ) ]]; then
    echo "Performing step ${STEP}."
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
  # Confirm that Jenkins pushed a new version of the app's container to
  # the cloud.
  if [[ ( START_POINT -le STEP ) && ( LAST_POINT -ge STEP ) ]]; then
    echo "Performing step ${STEP}."
  fi

  # Congratulations, it works!
  return 0
}

main "${@}"
exit ${?}
