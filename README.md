# Iac - Webserver
This project creates VPC, public and private subnet, nginx web server on ubuntu type EC2 instance in private subnet and elastic loadbalancer on AWS with Terraform.

Access Key ID and Secret Access Key needs to be stored in "~/.aws/credentials"

It needs to be run by entering pre-defined the name of Access Key ID and Secret Access Key in the credentials file. 

For instance with default;

$ terraform plan
var.profile
  AWS credentials profile you want to use

  Enter a value: default
