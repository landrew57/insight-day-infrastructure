data "aws_ami" "this" {
  most_recent      = true
  owners           = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-????????"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_subnet" "this" {
  filter {
    name   = "tag:Name"
    values = [var.subnet_name] # insert value here
  }
}

data "aws_vpc" "this" {}
