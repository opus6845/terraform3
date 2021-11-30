resource "aws_route_table" "Hong_rt" {
    vpc_id = aws_vpc.hong_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.Hong_igw.id
    }
    tags = {
      "Name" = "Hong-RoutingTable"
    }
  
}