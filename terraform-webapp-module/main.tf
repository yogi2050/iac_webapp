module "webapp" {
  source = "./terraform-webapp-module"

  # Specify inputs for the module
  vpc_cidr_block           = var.vpc_cidr_block
  public_subnet_cidr_block = var.public_subnet_cidr_block
  private_subnet_cidr_block = var.private_subnet_cidr_block
  instance_type             = var.instance_type
  root_volume_size         = var.root_volume_size
  log_volume_size          = var.log_volume_size
  web_server_port          = var.web_server_port
  lb_certificate_arn      = var.lb_certificate_arn
}
