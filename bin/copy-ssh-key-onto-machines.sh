#!/bin/bash

help() {
  echo <<EOF >&2
Usage:
  ${0} [ /path/to/key ]

  Copies the key from the first parameter (or by default
 ../vault/id_25519_aws_flaskcicd.pub) onto the machines in the
 project.

EOF

  return
}


# Update ssh/config with credentials for all running vagrant machines
# TODO make it work from other places inside the project
../bin/update-ssh-config.sh
# Script requires that machines can be connected to (with vagrant
# credentials/ssh key) and that the connection details are stored in
# ~/.ssh/config.

# Todo: make the list creation automatic
MACHINES_LIST=(
  "jenkins"
  "playbook-test-jenkins" )

DEFAULT_KEY="../vault/id_25519_aws_flaskcicd.pub"

KEY_TO_COPY=${1:-${"DEFAULT_KEY"} }

for server in "${MACHINES_LIST[@]}"; do
  ssh-copy-id -f -i "${KEY_TO_COPY}" \
              vagrant@"${server}" ;
done

exit 0

