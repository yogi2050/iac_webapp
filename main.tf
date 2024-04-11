provider "aws" {
  region = "us-east-1"  # Update with your desired AWS region
}

module "vpc" {
  source = "./modules/vpc"
  vpc_cidr_block = var.vpc_cidr_block
}

module "subnets" {
  source = "./modules/subnets"
  vpc_id                        = module.vpc.vpc_id
  public_subnet_cidr_block      = var.public_subnet_cidr_block
  public_subnet_availability_zone = var.public_subnet_availability_zone
  private_subnet_cidr_block     = var.private_subnet_cidr_block
  private_subnet_availability_zone = var.private_subnet_availability_zone
}

module "security_groups" {
  source = "./modules/security_groups"
  vpc_id                        = module.vpc.vpc_id
  lb_ingress_port_from          = var.lb_ingress_port_from
  lb_ingress_port_to            = var.lb_ingress_port_to
  lb_ingress_protocol           = var.lb_ingress_protocol
  lb_ingress_cidr_blocks        = var.lb_ingress_cidr_blocks
  lb_egress_port_from           = var.lb_egress_port_from
  lb_egress_port_to             = var.lb_egress_port_to
  lb_egress_protocol            = var.lb_egress_protocol
  lb_egress_cidr_blocks         = var.lb_egress_cidr_blocks
  instance_ingress_port_from    = var.instance_ingress_port_from
  instance_ingress_port_to      = var.instance_ingress_port_to
  instance_ingress_protocol     = var.instance_ingress_protocol
  instance_ingress_security_groups = var.instance_ingress_security_groups
  instance_egress_port_from     = var.instance_egress_port_from
  instance_egress_port_to       = var.instance_egress_port_to
  instance_egress_protocol      = var.instance_egress_protocol
  instance_egress_cidr_blocks   = var.instance_egress_cidr_blocks
}

module "load_balancer" {
  source = "./modules/load_balancer"
  lb_name                            = var.lb_name
  lb_internal                        = var.lb_internal
  lb_type                            = var.lb_type
  lb_subnets                         = module.subnets.public_subnet_ids
  lb_security_group_id               = module.security_groups.load_balancer_sg_id
}

module "autoscaling" {
  source = "./modules/autoscaling"
  image_id               = var.image_id
  instance_type          = var.instance_type
  instance_security_group_id = module.security_groups.instance_sg_id
  user_data              = file("./scripts/userdata.sh")
  asg_min_size           = var.asg_min_size
  asg_max_size           = var.asg_max_size
  asg_desired_capacity   = var.asg_desired_capacity
  asg_subnet_ids         = module.subnets.private_subnet_ids
}

module "instances" {
  source = "./modules/instances"
  ami_id                           = var.ami_id
  instance_type                    = var.instance_type
  instance_subnet_id               = module.subnets.private_subnet_ids[0] // Choose the first private subnet
  root_volume_type                 = var.root_volume_type
  root_volume_size                 = var.root_volume_size
  root_volume_delete_on_termination = var.root_volume_delete_on_termination
  secondary_volume_device_name     = var.secondary_volume_device_name
  secondary_volume_type            = var.secondary_volume_type
  secondary_volume_size            = var.secondary_volume_size
  secondary_volume_delete_on_termination = var.secondary_volume_delete_on_termination
}

module "ansible_configuration" {
  source = "./modules/ansible_configuration"
}

module "tls_certificate" {
  source = "./modules/tls_certificate"
  private_key_algorithm     = var.private_key_algorithm
  private_key_rsa_bits      = var.private_key_rsa_bits
  certificate_key_algorithm = var.certificate_key_algorithm
  certificate_common_name   = var.certificate_common_name
}
