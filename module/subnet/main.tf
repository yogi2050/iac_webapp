resource "aws_subnet" "public_subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.public_subnet_cidr_block
  availability_zone = var.public_subnet_availability_zone
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnet_cidr_block
  availability_zone = var.private_subnet_availability_zone
}

output "public_subnet_ids" {
  description = "IDs of the created public subnets"
  value       = [aws_subnet.public_subnet.id]
}

output "private_subnet_ids" {
  description = "IDs of the created private subnets"
  value       = [aws_subnet.private_subnet.id]
}
