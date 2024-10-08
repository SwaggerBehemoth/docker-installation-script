#/bin/bash

sudo apt-get update
sudo apt-get  install expect -y

echo "1st step - Install dependencies"
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y

echo "2nd step - Add the official Docker GPG key"

sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

##  0R

##  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -    ##

echo  "3rd Step - Add the Docker repository"


echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

##  yes " " | sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"  ##
#   apt-cache policy docker-ce  #

echo  "4th Step - Install Docker Engine, CLI and docker compose plugin"

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
##  sudo apt-get install docker-ce -y       ##

echo "5th Step - Add the current user to the 'docker' group to run Docker commands without 'sudo'"

sudo usermod -aG docker ${USER}
echo "Succesfully installed docker version " $(docker --version)

echo "Succesfully installed docker compose  version " $(docker-compose --version)
