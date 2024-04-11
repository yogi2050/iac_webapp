resource "aws_instance" "my_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.instance_subnet_id
  
  root_block_device {
    volume_type           = var.root_volume_type
    volume_size           = var.root_volume_size
    delete_on_termination = var.root_volume_delete_on_termination
  }
  
  ebs_block_device {
    device_name           = var.secondary_volume_device_name
    volume_type           = var.secondary_volume_type
    volume_size           = var.secondary_volume_size
    delete_on_termination = var.secondary_volume_delete_on_termination
  }
}
