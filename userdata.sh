#! /bin/bash

################# install docker and docker compose #########################
#sudo apt update
#sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
#sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs)  stable"
#sudo apt update
#sudo apt-get install docker-ce
#sudo systemctl start docker
#sudo systemctl enable docker
#sudo apt  install docker-compose
#sudo groupadd docker
#sudo usermod -aG docker ubuntu

sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt -y update
apt-cache policy docker-ce
sudo apt -y install docker-ce
sudo systemctl start docker
sudo systemctl enable docker
sudo apt -y install docker-compose
sudo groupadd docker
sudo usermod -aG docker $USER
sudo chown root:docker /var/run/docker.sock
sudo chmod 666 /var/run/docker.sock

####################### docker login  #############################

sudo docker login -u 254456369 --password dckr_pat_dZGs9tZFnmN0UBbPZoLF0vI-RJs


####################### pull image from docker hub  #############################

sudo docker pull 254456369/inshare-backend:in-back


####################### run docker image  #############################

sudo docker run -d -p 3000:3000 254456369/inshare-backend:in-back
