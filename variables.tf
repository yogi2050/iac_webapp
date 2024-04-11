variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
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

variable "lb_ingress_port_from" {
  description = "Start of port range for load balancer ingress rule"
  type        = number
}

variable "lb_ingress_port_to" {
  description = "End of port range for load balancer ingress rule"
  type        = number
}

variable "lb_ingress_protocol" {
  description = "Protocol for load balancer ingress rule"
  type        = string
}

variable "lb_ingress_cidr_blocks" {
  description = "CIDR blocks to allow for load balancer ingress"
  type        = list(string)
}

variable "lb_egress_port_from" {
  description = "Start of port range for load balancer egress rule"
  type        = number
}

variable "lb_egress_port_to" {
  description = "End of port range for load balancer egress rule"
  type        = number
}

variable "lb_egress_protocol" {
  description = "Protocol for load balancer egress rule"
  type        = string
}

variable "lb_egress_cidr_blocks" {
  description = "CIDR blocks to allow for load balancer egress"
  type        = list(string)
}

variable "instance_ingress_port_from" {
  description = "Start of port range for instance ingress rule"
  type        = number
}

variable "instance_ingress_port_to" {
  description = "End of port range for instance ingress rule"
  type        = number
}

variable "instance_ingress_protocol" {
  description = "Protocol for instance ingress rule"
  type        = string
}

variable "instance_ingress_security_groups" {
  description = "Security groups to allow for instance ingress"
  type        = list(string)
}

variable "instance_egress_port_from" {
  description = "Start of port range for instance egress rule"
  type        = number
}

variable "instance_egress_port_to" {
  description = "End of port range for instance egress rule"
  type        = number
}

variable "instance_egress_protocol" {
  description = "Protocol for instance egress rule"
  type        = string
}

variable "instance_egress_cidr_blocks" {
  description = "CIDR blocks to allow for instance egress"
  type        = list(string)
}

variable "lb_name" {
  description = "Name of the load balancer"
  type        = string
}

variable "lb_internal" {
  description = "Boolean flag indicating if the load balancer is internal"
  type        = bool
}

variable "lb_type" {
  description = "Type of the load balancer (e.g., application, network)"
  type        = string
}

variable "ami_id" {
  description = "ID of the AMI to use for instances"
  type        = string
}

variable "instance_type" {
  description = "Instance type for instances"
  type        = string
}

variable "root_volume_type" {
  description = "Type of the root volume for instances"
  type        = string
}

variable "root_volume_size" {
  description = "Size of the root volume for instances (in GB)"
  type        = number
}

variable "root_volume_delete_on_termination" {
  description = "Boolean flag indicating whether to delete root volume on instance termination"
  type        = bool
}

variable "secondary_volume_device_name" {
  description = "Device name for the secondary volume"
  type        = string
}

variable "secondary_volume_type" {
  description = "Type of the secondary volume"
  type        = string
}

variable "secondary_volume_size" {
  description = "Size of the secondary volume (in GB)"
  type        = number
}

variable "secondary_volume_delete_on_termination" {
  description = "Boolean flag indicating whether to delete secondary volume on instance termination"
  type        = bool
}

variable "user_data" {
  description = "User data script for instances"
  type        = string
}

variable "asg_min_size" {
  description = "Minimum size of the autoscaling group"
  type        = number
}

variable "asg_max_size" {
  description = "Maximum size of the autoscaling group"
  type        = number
}

variable "asg_desired_capacity" {
  description = "Desired capacity of the autoscaling group"
  type        = number
}

variable "private_key_algorithm" {
  description = "Algorithm for generating private key"
  type        = string
}

variable "private_key_rsa_bits" {
  description = "RSA bits for generating private key"
  type        = number
}

variable "certificate_key_algorithm" {
  description = "Algorithm for TLS certificate key"
  type        = string
}

variable "certificate_common_name" {
  description = "Common name for TLS certificate"
  type        = string
}
