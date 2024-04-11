resource "aws_vpc" "my_vpc" {
  cidr_block       = var.vpc_cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
}

output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.my_vpc.id
}
