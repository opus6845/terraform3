
# Launch Configuration
resource "aws_launch_configuration" "Hong_Conf" {
  name = "${var.name}-Conf"
  image_id      = aws_ami_from_instance.Hong_ami_instance.id
  instance_type = var.instance_type
  iam_instance_profile = var.instance_profile
  security_groups = [aws_security_group.Hong_sg.id]
  key_name = var.key
  user_data =<<-EOF
                #!/bin/bash
                systemctl start httpd
                systemctl enable httpd
                EOF

}

# Auto Scailing
resource "aws_placement_group" "Hong_place_group" {
  name = "${var.name}-pg"
  strategy = var.pg_strategy
}
resource "aws_autoscaling_group" "Hong_AG" {
  name                      = "${var.name}-AG"
  max_size                  = 10
  min_size                  = 2
  health_check_grace_period = 60
  health_check_type         = "EC2"
  desired_capacity          = 2     #원하는 확장 개수
  force_delete              = false  # 강제 삭제
#  placement_group           = aws_placement_group.Hong_place_group.id
  launch_configuration      = aws_launch_configuration.Hong_Conf.name
  vpc_zone_identifier       = [aws_subnet.Hong_Pub[0].id,aws_subnet.Hong_Pub[1].id] # 오토스케일링 VPC 사용 영역

}


# Auto scailing Attachment

resource "aws_autoscaling_attachment" "Hong_asg_att" {
  autoscaling_group_name = aws_autoscaling_group.Hong_AG.id
  alb_target_group_arn = aws_lb_target_group.Hong_albtg.arn
}