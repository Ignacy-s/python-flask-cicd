#!/bin/bash

# Script for managing a LUKS vault for project secrets like SSH keys.

VAULT_DIR="$(pwd)/vault"
CONTAINER="${VAULT_DIR}.img"
MOUNT_POINT="${VAULT_DIR}"
PASS_VAR="VAULT_PASSPHRASE"
VAULT_DEVICE="my_project_vault"

# set -x to be commented out when script is confirmed to work
# flawlessly
# set -x

function usage() {
  echo "Usage: ${0} {create|open|close}"
  exit 1
}

function die() {
  # Exit with a message.
  MESSAGE="${*}"
  echo -e "${MESSAGE}" >&2
  exit 1
}


function create_container() {
  # Creates a LUKS container and sets up a filesystem on it.

  # mkdir -p won't signal an error if dir exists
  mkdir -p "${VAULT_DIR}" \
    || die "Couldn't create vault."

  # Test if the container doesn't already exist.
  if [[ -s "${CONTAINER}" ]] && cryptsetup isLuks "${CONTAINER"
  then
    echo "A LUKS container already exists at ${CONTAINER}." >&2
    echo "Remove it by hand to use this script to create a new one." >&2
    exit 1
  fi

  # Create a block device for the new container
  dd if=/dev/zero of="${CONTAINER}" bs=1M count=30 \
     || die "Error creating image file."
  # Create a luks2 container in this block.
  echo -n "${!PASS_VAR}" | sudo cryptsetup luksFormat \
                                --type luks2 \
                                --key-file=- \
                                "${CONTAINER}" \
       || die "Error formating image as LUKS container."

  # Open the container temporarily to create a filesystem on it.
  echo -n "${!PASS_VAR}" | sudo cryptsetup luksOpen \
                                --key-file=- \
                                "${CONTAINER}" \
                                "${VAULT_DEVICE}" \
                    || die "Error opening container."
  sudo mkfs.ext4 /dev/mapper/"${VAULT_DEVICE}" \
    || die "Error creating filesystem on container."
  sudo cryptsetup luksClose "${VAULT_DEVICE}" \
    || die "Error closing container."
}

function open_container() {
  # Opens the LUKS container and mounts it.

  echo -n "${!PASS_VAR}" | sudo cryptsetup luksOpen \
                                --key-file=- \
                                "${CONTAINER}" \
                                "${VAULT_DEVICE}" \
                    || die "Error opening container."
  sudo mkdir -p "${MOUNT_POINT}" \
    || die "Error creating mountpoint."
  sudo mount /dev/mapper/"${VAULT_DEVICE}" "${MOUNT_POINT}" \
    || die "Error mounting container."
  sudo chown "${USER}": "${MOUNT_POINT}" \
    || die "Error setting ownership of ${MOUNT_POINT} to ${USER}."
}

function close_container() {
  # Unmounts and closes the LUKS container.
  sudo umount "${MOUNT_POINT}" \
       || die "Error unmounting container."
  sudo cryptsetup luksClose "${VAULT_DEVICE}" \
       || die "Error closing container."
}

# Make sure that the PASS_VAR points at a non-empty variable
if [[ -z "${!PASS_VAR}" ]]; then
  die "The '${PASS_VAR}' variable is empty or not defined.\n\
Need to know Vault's password to create/open it."
fi

# Inform the user about why the script prompts him for his password
# Only if there is no sudo password cached
if ! sudo -n true 2>/dev/null; then
  cat <<EOF >&2
This script needs sudo privileges to mount containers or to use
the cryptsetup binary.
EOF
fi

case "${1}" in
  create)
    create_container
    ;;
  open)
    open_container
    ;;
  close)
    close_container
    ;;
  *)
    usage
    ;;
esac

exit 0
