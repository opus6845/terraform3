# Create IGW
resource "aws_internet_gateway" "Hong_igw" {
    vpc_id = aws_vpc.hong_vpc.id
    tags = {
      "Name" = "${var.name}-IGW"
    }
  
}

# IGW Routing Table
resource "aws_route_table" "Hong_rt" {
    vpc_id = aws_vpc.hong_vpc.id

    route {
        cidr_block = var.cidr_route
        gateway_id = aws_internet_gateway.Hong_igw.id
    }
    tags = {
      "Name" = "${var.name}-RoutingTable"
    }
  
}

# Associating Routing Table with IGW 
resource "aws_route_table_association" "Hong_igwAss_Public" {
    count = length(var.pub_sub)
    subnet_id = aws_subnet.Hong_Pub[count.index].id
    route_table_id = aws_route_table.Hong_rt.id 
}
