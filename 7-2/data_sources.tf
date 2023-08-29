data "aws_region" "current" {}

data "aws_vpcs" "all_vpcs" {}

data "aws_availability_zones" "available_zones" {
  state = "available"
}

data "aws_ami" "ubuntu" {
  owners       = ["099720109477"]
  most_recent  = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-*-amd64-server-*"]
  }
}

data "aws_security_groups" "security_groups" {
  filter {
    name = "group-name"
    values = [ "HW_7-2_security_group" ]
  }
}