#!/bin/bash

if [[ $EUID -ne 0 ]]; then
 echo "This script must be run as root" 
 exit 1
else
 
 echo "Updating and Upgrading...."
 sudo apt-get update && sudo apt-get upgrade
 
 echo "Preparing to Install Docker...."
 sudo  apt-get install apt-transport-https
 sudo apt-get install ca-certificates
 sudo apt-get install curl
 sudo apt-get install software-properties-common
 
 echo "Adding Docker Key...."
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add
 sudo apt-key fingerprint 0EBFCD88
 
 echo "Adding Docker Repo...."
 sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
 
 echo "Updating...."
 sudo apt-get update
 
 echo "Installing Docker CE...."
 sudo apt-get install docker-ce
 
 
 echo "Installing Docker Compose...."
 sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
 sudo chmod +x /usr/local/bin/docker-compose
 
 echo "Installing Cockpit...."
 apt-get update && apt-get install cockpit
 
 echo "Installing Cockpit Docker...."
 apt-get update && apt-get install cockpit-docker
 
 echo "Installing SSH...."
 sudo apt install ssh
 
 
 echo "Docker Key Verification:"
 sudo apt-key fingerprint 0EBFCD88
 
 echo "Docker CE Install Verification:"
 sudo docker run hello-world
 
 echo "Docker Compose Verification:"
 sudo docker-compose --version
 
 echo "SSH Verification:"
 service ssh status
 
 fi
