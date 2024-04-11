resource "aws_security_group" "load_balancer_sg" {
  vpc_id = var.vpc_id
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "instance_sg" {
  vpc_id = var.vpc_id
  
  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.load_balancer_sg.id]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "load_balancer_sg_id" {
  description = "ID of the load balancer security group"
  value       = aws_security_group.load_balancer_sg.id
}

output "instance_sg_id" {
  description = "ID of the instance security group"
  value       = aws_security_group.instance_sg.id
}
