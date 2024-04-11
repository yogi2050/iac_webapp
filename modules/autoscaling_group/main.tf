# Launch Template
resource "aws_launch_template" "my_lt" {
  name_prefix   = "MyLaunchTemplate"
  image_id      = "YOUR_AMI_ID"  # Replace with the latest AMI ID
  instance_type = "t2.micro"     # Adjust as needed

  block_device_mappings {
    device_name = "/dev/xvda"   # Root volume
    ebs {
      volume_size           = 20  # Adjust the size as needed
      volume_type           = "gp2"
      delete_on_termination = true
    }
  }

  block_device_mappings {
    device_name = "/dev/xvdb"   # Secondary volume for logs
    ebs {
      volume_size           = 10  # Adjust the size as needed
      volume_type           = "gp2"
      delete_on_termination = true
    }
  }

  # Other configuration parameters such as security groups, user data, etc.
}

# Auto Scaling Group
resource "aws_autoscaling_group" "my_asg" {
  name                  = "MyAutoScalingGroup"
  vpc_zone_identifier   = [aws_subnet.private_subnet.id]  # Assuming compute instances are launched in the private subnet
  launch_template {
    id      = aws_launch_template.my_lt.id
    version = aws_launch_template.my_lt.latest_version
  }
  min_size              = 1
  max_size              = 3  # Adjust as needed
  desired_capacity      = 2  # Adjust as needed
}

# Launch Configuration
resource "aws_launch_configuration" "my_lc" {
  name = "MyLaunchConfiguration"
  image_id = "YOUR_AMI_ID" # Replace with the latest AMI ID
  instance_type = "t2.micro" # Adjust as needed
  security_groups = [aws_security_group.compute_sg.id] # Assuming compute instances use this security group
}
