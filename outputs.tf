# outputs.tf
output "autoscaling_group_name" {
  description = "Name of the Auto Scaling Group"
  value       = module.autoscaling.name
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "private_subnets" {
  description = "Private subnets in the VPC"
  value       = module.vpc.private_subnets
}

output "public_subnets" {
  description = "Public subnets in the VPC"
  value       = module.vpc.public_subnets
}

output "security_group_id" {
  description = "ID of the security group"
  value       = module.security_group.this_security_group_id
}