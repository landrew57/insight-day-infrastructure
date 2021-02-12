module "ec2_jenkins" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  name                   = "jenkins"
  instance_count         = 1

  ami                    = data.aws_ami.this.id
  instance_type          = "t3.medium"
  key_name               = var.key_name
  monitoring             = true
  vpc_security_group_ids = [module.jenkins_security_group.this_security_group_id,module.ssh_security_group.this_security_group_id]
  subnet_id              = data.aws_subnet.this.id
  associate_public_ip_address = "true"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "ec2_nginx" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  name                   = "nginx"
  instance_count         = 2

  ami                    = data.aws_ami.this.id
  instance_type          = "t3.small"
  key_name               = var.key_name
  monitoring             = true
  vpc_security_group_ids = [module.nginx_security_group.this_security_group_id,module.ssh_security_group.this_security_group_id]
  subnet_id              = data.aws_subnet.this.id
  associate_public_ip_address = "true"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
