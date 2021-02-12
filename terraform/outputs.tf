output "nginx_public_ip" {
  description = "nginx public ip address"
  value = module.ec2_nginx.public_ip
}

output "nginx_private_ip" {
  description = "nginx private ip address"
  value = module.ec2_nginx.private_ip
}

output "jenkins_public_ip" {
  description = "jenksin public ip address"
  value = module.ec2_jenkins.public_ip
}

output "jenkins_private_ip" {
  description = "jenkins private ip address"
  value = module.ec2_jenkins.private_ip
}

