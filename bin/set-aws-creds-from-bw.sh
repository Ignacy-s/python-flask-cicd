#!/bin/bash

# WARNING: SOURCE THIS SCRIPT, DON'T JUST RUN IT.
# example usage: source ./set_aws_creds-from-bw.sh

# Why not just have the credentials pulled from bitwarden?

## VARIABLES

bitwarden_search_string="terraform"


## FUNCTIONS

usage(){
  # Print script's usage.
  cat <<EOF
   Usage:
     source ${0}
   or
     . ${0}

  This scripts sets the aws credentials in exported global variables,
  which 

EOF
}

cleanup(){
  # Cleanup bw output and script functions, run by TRAP on EXIT
  unset bw_output aws_access_key_id aws_secret_access_key
  unset -f usage cleanup main set_aws_key
}

# Run cleanup() on EXIT
trap cleanup EXIT

set_aws_key(){
  # Get the bw output, find needed secrets and export them as global
  # variables
  local bw_output
  bw_output="$(bw list items --search "${bitwarden_search_string}")"

  local aws_access_key_id aws_secret_access_key

  aws_access_key_id=$( jq -r \
    '.[].fields[]
     | select(.name == "Access Key") 
     | .value'\
    <<< $bw_output )

  aws_secret_access_key=$( jq -r \
    '.[].fields[]
     | select(.name == "Secret access key") 
     | .value'\
    <<< $bw_output )


  export AWS_ACCESS_KEY_ID="$aws_access_key_id"
  export AWS_SECRET_ACCESS_KEY="$aws_secret_access_key"
}

## Main function

main() {
  # Print out some help if script is run with arguments.
  if [[ $# -gt 0 ]]
  then
    if [[ "${1}" != "-h" ]] && [[ "${1}" != "--help" ]]
    then
      echo \
        "This script doesn't take in arguments, it works interactively."
    fi
    usage
    return 1
  fi

  if [[ "$0" == "$BASH_SOURCE" ]]
  then
    echo "Script was run instead of being sourced."
    echo \
      "Remember to *source* this script instead of just running it."
    usage
    return 1
  fi

  set_aws_key
}

main "${@}"

