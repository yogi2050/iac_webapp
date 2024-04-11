# variables.tf
variable "region" {
  description = "AWS region"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "ami_id" {
  description = "ID of the AMI to use for instances"
  type        = string
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
}

variable "asg_name" {
  description = "Name of the Auto Scaling Group"
  type        = string
}

variable "asg_min_size" {
  description = "Minimum number of instances in the Auto Scaling Group"
  type        = number
}

variable "asg_max_size" {
  description = "Maximum number of instances in the Auto Scaling Group"
  type        = number
}

variable "asg_desired_capacity" {
  description = "Desired number of instances in the Auto Scaling Group"
  type        = number
}

variable "lc_name_prefix" {
  description = "Prefix for the launch configuration name"
  type        = string
}

variable "security_group_name" {
  description = "Name of the security group"
  type        = string
}

variable "ingress_cidr_blocks" {
  description = "CIDR blocks to allow incoming traffic"
  type        = list(string)
}

variable "egress_cidr_blocks" {
  description = "CIDR blocks to allow outgoing traffic"
  type        = list(string)
}
