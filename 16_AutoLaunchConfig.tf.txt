resource "aws_launch_configuration" "Hong_Conf" {
  name = "Hong-Conf"
  image_id      = aws_ami_from_instance.Hong_ami_instance.id
  instance_type = "t2.micro"
  iam_instance_profile = "admin_role"
  security_groups = [aws_security_group.Hong_sg.id]
  key_name = "Hongkey"
  user_data =<<-EOF
                #!/bin/bash
                systemctl start httpd
                systemctl enable httpd
                EOF

}
