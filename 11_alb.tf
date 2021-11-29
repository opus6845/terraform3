resource "aws_lb" "Hong_alb" {
    name = "Hong-alb"
    internal = false
    load_balancer_type = "application"
    security_groups = [aws_security_group.Hong_sg.id]
    subnets = [aws_subnet.Hong_Pub_a.id, aws_subnet.Hong_Pub_c.id]
    tags = {
      "Name" = "Hong-alb"
    }
  
}