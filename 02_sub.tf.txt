# 가용영역 a의 Public Subnet
resource "aws_subnet" "Hong_Pub_a" {
  vpc_id            = aws_vpc.hong_vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "Hong-Pub-a"
  }

}

# 가용영역 c의 Public Subnet
resource "aws_subnet" "Hong_Pub_c" {
  vpc_id            = aws_vpc.hong_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "Hong-Pub-c"
  }

}
# 가용영역 a의 Private Subnet
resource "aws_subnet" "Hong_Prv_a" {
  vpc_id            = aws_vpc.hong_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "Hong-Prv-a"
  }

}
#가용영역 c의 Private Subnet
resource "aws_subnet" "Hong_Prv_c" {
  vpc_id            = aws_vpc.hong_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "Hong-Prv-c"
  }

}
# 가용영역 a의 Private DB Subnet
resource "aws_subnet" "Hong_Prv_db_a" {
  vpc_id            = aws_vpc.hong_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "Hong-Prv-db-a"
  }

}

# 가용영역 c의 Private DB Subnet
resource "aws_subnet" "Hong_Prv_db_c" {
  vpc_id            = aws_vpc.hong_vpc.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "Hong-Prv-db-c"
  }

}
