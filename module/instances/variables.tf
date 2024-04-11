variable "ami_id" {
  description = "ID of the AMI to use for the instance"
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
