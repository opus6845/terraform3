resource "aws_ami_from_instance" "Hong_ami_instance" {
  name               = "${var.name}-AMI"
  source_instance_id = aws_instance.Hong_web.id
  depends_on = [
    aws_instance.Hong_web
  ]
}