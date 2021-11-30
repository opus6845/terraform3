resource "aws_placement_group" "Hong_place_group" {
  name = "Hong-pg"
  strategy = "cluster"
}
resource "aws_autoscaling_group" "Hong_AG" {
  name                      = "Hong-AG"
  max_size                  = 10
  min_size                  = 2
  health_check_grace_period = 60
  health_check_type         = "EC2"
  desired_capacity          = 2     #원하는 확장 개수
  force_delete              = true  # 강제 삭제
#  placement_group           = aws_placement_group.Hong_place_group.id
  launch_configuration      = aws_launch_configuration.Hong_Conf.name
  vpc_zone_identifier       = [aws_subnet.Hong_Pub_a.id,aws_subnet.Hong_Pub_c.id] # 오토스케일링 VPC 사용 영역

}