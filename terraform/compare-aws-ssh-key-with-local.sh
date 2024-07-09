#!/bin/bash
# Date: 2024-07-07
# Author: ChatGPT - OpenAI, supervised by Ignacy
# Description: This script compares the SSH key fingerprint from AWS
#              with the local SSH key fingerprint.  It outputs a
#              JSON-formatted string indicating whether the local key
#              should be uploaded to AWS.

# Input parameters
KEY_NAME="${1}"
LOCAL_KEY_PATH="${2}"

test_fingerprint(){
# Test if fingerprints didn't change its form to future-proof the
# script a little bit
FINGERPRINT="${1}"
if ! [[ "$FINGERPRINT" =~ ^[A-Za-z0-9+/]+={0,2}$ ]]; then
  echo "Error: Unexpected fingerprint format."
  exit 1
fi
}


# Check if the key exists in AWS and fetch its fingerprint
AWS_KEY_FINGERPRINT="$(aws ec2 describe-key-pairs \
  --key-names "${KEY_NAME}" \
  --query 'KeyPairs[0].KeyFingerprint' --output text 2>/dev/null)"
AWS_KEY_EXISTS="${?}"

# Check the last command's exit status to determine if the key was found
if [[ AWS_KEY_EXISTS -ne 0 ]]; then
  # If the AWS key does not exist, return false to signal Terraform to
  # create a new key
  echo '{"match":"false"}'
  exit 0
fi

test_fingerprint "${AWS_KEY_FINGERPRINT}"

# Remove potential '=' padding from the AWS fingerprint
# AWS encodes fingerprints in base64 with '=' padding at the end
AWS_KEY_FINGERPRINT="${AWS_KEY_FINGERPRINT%=*}"

# Generate the fingerprint of the local SSH key
LOCAL_KEY_FINGERPRINT="$(ssh-keygen -lf "${LOCAL_KEY_PATH}" \
                         | awk '{sub(/^[^:]+:/, "", $2); print $2}')"
# /^[^:]+:/ matches all characters from the start of the string up to
# and including the first colon, cleaning the fingerprint, which
# initially looks like this:
# SHA256:+1R6bdED3hFp5cGGhKJuEo1VX70vzMKgYB7Q8

test_fingerprint "${LOCAL_KEY_FINGERPRINT}"

# Compare the local key fingerprint with the AWS key fingerprint
if [[ "${LOCAL_KEY_FINGERPRINT}" == "${AWS_KEY_FINGERPRINT}" ]]; then
  # Keys match, we can use the existing key
  echo '{"match":"true"}'
else
  # Keys don't mach, need to re-upload the key
  echo '{"match":"false"}'
fi

# Finished successfully
exit 0
