resource "aws_lb_listener" "Hong_lb_listener" {
  load_balancer_arn = aws_lb.Hong_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.Hong_albtg.arn
  }
}