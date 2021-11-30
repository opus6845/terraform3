resource "aws_eip" "Hong_ngw_ip" {
    vpc = true
}
resource "aws_nat_gateway" "Hong_ngw" {
    allocation_id = aws_eip.Hong_ngw_ip.id
    subnet_id = aws_subnet.Hong_Pub_a.id
    tags = {
      "Name" = "Hong-ngw"
    }
}