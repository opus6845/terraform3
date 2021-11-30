
# NAT Elastic IP Allocation
resource "aws_eip" "Hong_ngw_ip" {
    vpc = true
}

# create NAT gate way 
resource "aws_nat_gateway" "Hong_ngw" {
    allocation_id = aws_eip.Hong_ngw_ip.id
    subnet_id = aws_subnet.Hong_Pub[0].id
    tags = {
      "Name" = "${var.name}-ngw"
    }
}

# NAT Routing Table 
resource "aws_route_table" "Hong_ngw_RT" {
    vpc_id = aws_vpc.hong_vpc.id

    route {
        cidr_block = var.cidr_route
        gateway_id = aws_nat_gateway.Hong_ngw.id

    }
    tags = {
      "Name" = "${var.name}-ngw-RoutingTable"
    }
  
}

# Associationg Routing Table with NAT
resource "aws_route_table_association" "Hong_ngw_Ass_Prv" {
    count = length(var.prv_sub)
    subnet_id = aws_subnet.Hong_Prv[count.index].id
    route_table_id = aws_route_table.Hong_ngw_RT.id
  
}

resource "aws_route_table_association" "Hong_ngw_Ass_Prv_DB" {
    count = length(var.prv_db_sub)
    subnet_id = aws_subnet.Hong_Prv_db[count.index].id
    route_table_id = aws_route_table.Hong_ngw_RT.id
  
}