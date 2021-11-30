resource "aws_route_table" "Hong_ngw_RT" {
    vpc_id = aws_vpc.hong_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.Hong_ngw.id

    }
    tags = {
      "Name" = "Hong-ngw-RoutingTable"
    }
  
}