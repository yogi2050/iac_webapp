module "vpc" {
  source = "./modules/vpc"
  vpc_cidr           = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"
  public_subnet_az   = "us-east-1a"
  private_subnet_az  = "us-east-1b"
}

module "security_group" {
  source              = "./modules/security_group"
  vpc_id              = module.vpc.vpc_id
  management_cidr_blocks = ["your_IP/32"]
}

module "autoscaling_group" {
  source = "./modules/autoscaling_group"
  // Define variables here
}

module "load_balancer" {
  source  = "./modules/load_balancer"
  vpc_id  = module.vpc.vpc_id
  // Define variables here
}
