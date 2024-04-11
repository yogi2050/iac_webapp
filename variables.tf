variable "vpc_id" {}
variable "management_cidr_blocks" {
  type    = list(string)
  default = []
}

// Define other variables as required
