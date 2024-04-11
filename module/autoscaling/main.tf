resource "aws_launch_configuration" "my_lc" {
  image_id        = var.image_id
  instance_type   = var.instance_type
  security_groups = [var.instance_security_group_id]
  user_data       = var.user_data
}

resource "aws_autoscaling_group" "my_asg" {
  launch_configuration = aws_launch_configuration.my_lc.name
  min_size             = var.asg_min_size
  max_size             = var.asg_max_size
  desired_capacity     = var.asg_desired_capacity
  vpc_zone_identifier  = var.asg_subnet_ids
}
