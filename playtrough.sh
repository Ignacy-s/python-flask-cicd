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
  # Prompt user for the vault password
  #TODO allow alternative, maybe read from file
  read -s -p 'Enter the vault password: ' VAULT_PASSPHRASE
  export VAULT_PASSPHRASE

  # Create and/or open a vault
  #TODO For now there will be an error if we try to re-create a vault or
  #open an existing vault if it's already open.

  # Check if a vault exists and can be opened with the


  # Generate an SSH key for the project

  # Upload the key to AWS

  # Ask user for the region, instance type, inform about defaults

  # Set up a VM on AWS using Terraform

  # Test that VM works

  # Provision the VM for operations in preparation for Jenkins
  # installation

  # Install Jenkins on the VM

  # Configure Jenkins on the VM

  # Have Jenkins deploy the app container to AWS

  # Commit a change to the project's code repo (modify code of the app)

  # Confirm that Jenkins pushed a new version of the app's container to
  # the cloud.

  # Congratulations, it works!
  return 0
}

main "${@}"
exit $?
