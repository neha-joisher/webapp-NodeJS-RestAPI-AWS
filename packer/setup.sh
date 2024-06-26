#!/bin/bash
export DEBIAN_FRONTEND=noninteractive


sudo apt-get update
sudo apt-get upgrade -y

sudo curl -O https://s3.amazonaws.com/amazoncloudwatch-agent/debian/amd64/latest/amazon-cloudwatch-agent.deb
sudo dpkg -i amazon-cloudwatch-agent.deb


sudo groupadd csye6225
sudo useradd -s /bin/false -g csye6225 -d /opt/csye6225 -m csye6225

sudo apt-get install -y nodejs npm unzip 
sudo npm install -g nodemon

sudo mkdir /opt/csye6225/webapp
sudo mv /home/admin/webapp1.zip /opt/csye6225/webapp/
cd /opt/csye6225/webapp/
sudo unzip webapp1.zip
sudo npm audit fix
sudo npm install


source_path="/home/admin/users.csv"
destination_path="/opt/"

# Move the file if it exists
[ -e "$source_path" ] && sudo mv "$source_path" "$destination_path" && echo "File 'users.csv' moved to '$destination_path'"

sudo mv /home/admin/webapp.service /etc/systemd/system/webapp.service
sudo mv /home/admin/config.json  /opt/aws/


sudo chown -R csye6225:csye6225 /opt/csye6225/
sudo chmod -R 750 /opt/csye6225/


sudo systemctl daemon-reload
sudo systemctl enable webapp
sudo systemctl start webapp
sudo systemctl enable amazon-cloudwatch-agent
sudo systemctl start amazon-cloudwatch-agent



