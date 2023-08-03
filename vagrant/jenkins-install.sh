#!/bin/bash
# Script installing Jenkins based on Jenkins documentation.

# Make script fail if a command fails
set -e

# Required for this script to work and for admins comfort
sudo dnf install wget bash-completion -y

# Install jenkins repo
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo dnf upgrade -y

# Add required dependencies for the jenkins package
sudo dnf install java-17-openjdk -y
sudo dnf install jenkins -y
sudo systemctl daemon-reload
# Enable and start the Jenkins service
sudo systemctl enable --now jenkins.service

# Add Jenkins to firewall
sudo systemctl enable --now firewalld.service
sudo firewall-cmd --add-service=jenkins --permanent
sudo firewall-cmd --reload
