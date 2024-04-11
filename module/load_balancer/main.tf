resource "aws_lb" "my_lb" {
  name               = var.lb_name
  internal           = var.lb_internal
  load_balancer_type = var.lb_type
  security_groups    = [var.lb_security_group_id]
  subnets            = var.lb_subnets
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.my_lb.arn
  port              = 80
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_target_group.arn
  }
}

output "lb_dns_name" {
  description = "DNS name of the load balancer"
  value       = aws_lb.my_lb.dns_name
}
