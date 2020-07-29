#!/bin/bash

# be careful of these keys, they will go out of date
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D68FA50FEA312927
echo "deb https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list



sudo apt-get update -y
sudo apt-get upgrade -y



# sudo apt-get install mongodb-org=3.2.20 -y
sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20



# remove the default .conf and replace with our own configuration
# thus before adding our own, we must remove the old configuration
sudo rm /etc/mongod.conf
sudo ln -s /home/vagrant/environment/mongod.conf /etc/mongod.conf



# if mongo is is set up correctly these will be successful
sudo systemctl restart mongod
sudo systemctl enable mongod



# Previous Code

##Update the sources list
#sudo apt-get update -y
#
## install mongodb
#
#
#wget -qO - https://www.mongodb.org/static/pgp/server-3.2.asc | sudo apt-key add -
#
#
#echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" >
#
#sudo apt-get update -y
#
#sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb->
#
#
#
#
##running mongodb
#
#
#sudo sed -i "s,\\(^[[:blank:]]*bindIp:\\) .*,\\1 0.0.0.0," /etc/mongod.conf
#sudo systemctl start mongod
#sudo systemctl status mongod
#sudo systemctl enable mongod
