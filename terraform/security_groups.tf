module "nginx_security_group" {
  source  = "terraform-aws-modules/security-group/aws//modules/http-80"
  version = "~> 3.0"

  name = "http_80"  
  vpc_id = data.aws_vpc.this.id
  
  ingress_cidr_blocks = ["0.0.0.0/0"]
}

module "jenkins_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  name        = "jenkins"
  description = "Security group for jenkins with custom ports open within VPC"
  vpc_id      = data.aws_vpc.this.id

  ingress_with_cidr_blocks = [
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      description = "jenkins port"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}

module "ssh_security_group" {
  source  = "terraform-aws-modules/security-group/aws//modules/ssh"
  version = "~> 3.0"

  name = "ssh_security_group"
  vpc_id = data.aws_vpc.this.id

  ingress_cidr_blocks      = ["0.0.0.0/0"]
}
