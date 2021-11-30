resource "aws_autoscaling_attachment" "Hong_asg_att" {
  autoscaling_group_name = aws_autoscaling_group.Hong_AG.id
  alb_target_group_arn = aws_lb_target_group.Hong_albtg.arn
}