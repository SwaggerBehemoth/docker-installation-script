#!/usr/bin/bash

sudo apt-get update
sudo apt-get install expect -y

echo -e "\n\n\n1st step - Install dependencies\n\n"
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y

echo -e "\n\n2nd step - Add the official Docker GPG key\n\n"

sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

##  0R

##  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -    ##

echo -e  "\n\n3rd Step - Add the Docker repository\n\n"


echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

echo -e  "\n\n4th Step - Install Docker Engine, CLI and docker compose plugin\n\n"

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

echo -e "\n\n5th Step - Add the current user to the 'docker' group to run Docker commands without 'sudo'\n\n"

sudo usermod -aG docker ${USER}
echo -e "\n\nSuccesfully installed docker version " $(docker --version)

echo -e "\n\nSuccesfully installed docker compose  version " $(docker compose version)
