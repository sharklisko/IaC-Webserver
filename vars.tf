variable "profile" {
    description = "AWS credentials profile you want to use"
}

variable "AWS_REGION" {
  default = "eu-west-1"
}

variable "AMIS" {
  type = map(string)
  default = {
    eu-west-1 = "ami-00e7df8df28dfa791"
  }
}

