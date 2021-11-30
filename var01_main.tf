# AWS 리전 등록 (단일 서버 배포)
provider "aws" {
  region = var.region
}


resource "aws_key_pair" "hongkey" {
  key_name   = var.key
  public_key = file("../../.ssh/hongkey1.pub")
}

resource "aws_vpc" "hong_vpc" {
  cidr_block           = var.cidr_main
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    "Name" = "${var.name}-VPC"
  }
}
# Public Subnet
resource "aws_subnet" "Hong_Pub" {

  count             = length(var.pub_sub)
  vpc_id            = aws_vpc.hong_vpc.id
  cidr_block        = var.pub_sub[count.index]
  availability_zone = "${var.region}${var.av_zone[count.index]}"
  tags = {
    "Name" = "${var.name}-Pub-${var.av_zone[count.index]}"
  }

}

# Private Subnet
resource "aws_subnet" "Hong_Prv" {
  count             = length(var.prv_sub)
  vpc_id            = aws_vpc.hong_vpc.id
  cidr_block        = var.prv_sub[count.index]
  availability_zone = "${var.region}${var.av_zone[count.index]}"
  tags = {
    "Name" = "${var.name}-Prv-${var.av_zone[count.index]}"
  }

}
# Private DB Subnet
resource "aws_subnet" "Hong_Prv_db" {
  count             = length(var.prv_db_sub)
  vpc_id            = aws_vpc.hong_vpc.id
  cidr_block        = var.prv_db_sub[count.index]
  availability_zone = "${var.region}${var.av_zone[count.index]}"
  tags = {
    "Name" = "${var.name}-Prv-DB-${var.av_zone[count.index]}"
  }

}
