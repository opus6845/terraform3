resource "aws_internet_gateway" "Hong_igw" {
    vpc_id = aws_vpc.hong_vpc.id
    tags = {
      "Name" = "Hong-IGW"
    }
  
}