variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "lb_ingress_port_from" {
  description = "Start of port range for load balancer ingress rule"
  type        = number
}

// Define other variables as needed
