resource "aws_lb" "Hong_alb" {
    name = "${var.name}-alb"
    internal = false
    load_balancer_type = var.lb_type
    security_groups = [aws_security_group.Hong_sg.id]
    subnets = [aws_subnet.Hong_Pub[0].id, aws_subnet.Hong_Pub[1].id]
    tags = {
      "Name" = "${var.name}-alb"
    }
}
output "dns_name" {
      value = aws_lb.Hong_alb.dns_name
  }

resource "aws_lb_target_group" "Hong_albtg" {
    name = "${var.name}-albtg"
    port = 80
    protocol = "HTTP"
    vpc_id = aws_vpc.hong_vpc.id

    health_check {
      enabled = true
      healthy_threshold = 3
      interval = 5
      matcher = "200"
      path = var.health_check_path
      port = var.health_check_port
      protocol = "HTTP"
      timeout = 2
      unhealthy_threshold = 2
    }
  
}

resource "aws_lb_listener" "Hong_lb_listener" {
  load_balancer_arn = aws_lb.Hong_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = var.lb_listenr_tg_type
    target_group_arn = aws_lb_target_group.Hong_albtg.arn
  }
}