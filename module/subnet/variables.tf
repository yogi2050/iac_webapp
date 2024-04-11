variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "public_subnet_cidr_block" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "public_subnet_availability_zone" {
  description = "Availability zone for the public subnet"
  type        = string
}

variable "private_subnet_cidr_block" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "private_subnet_availability_zone" {
  description = "Availability zone for the private subnet"
  type        = string
}
