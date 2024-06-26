aws_region = "us-east-1"
source_ami = "ami-06db4d78cb1d3bbf9"
ssh_username = "admin"
subnet_id = "subnet-02b0c1b860ad092ee"
ami_description = "Debian AMI for CSYE 6225"
instance_type = "t2.micro"
device_name = "/dev/xvda"
volume_size = 8
volume_type = "gp2"
provisioner_users_source = "../users.csv"
provisioner_users_destination = "/home/admin/users.csv"
provisioner_webapp_source = "/home/runner/work/webapp/webapp/webapp1.zip"
provisioner_webapp_destination = "/home/admin/webapp1.zip"
provisioner_service_source = "../webapp.service"
provisioner_service_destination = "/home/admin/webapp.service"
provisioner_shell_script = "./setup.sh"
provisioner_config_source = "../statsd/config.json"
provisioner_config_destination = "/home/admin/config.json"