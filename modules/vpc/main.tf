provider "aws" {
  region = var.region
}

resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_internet_gateway" "ig" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags = {
    Name        = "${vpc_name}-igw"
  }
}

resource "aws_eip" "nat_eip" {
  vpc        = true
  depends_on = [aws_internet_gateway.ig]
}

resource "aws_subnet" "subnet" {
  vpc_id = aws_vpc.this.id
  cidr_block = "10.0.1.0/24"
  
}

resource "aws_nat_gateway" "nat" {
  allocation_id = "${aws_eip.nat_eip.id}"
  subnet_id     = "${element(aws_subnet.public_subnet.*.id, 0)}"
  depends_on    = [aws_internet_gateway.ig]
  tags = {
    Name        = "nat"
    Environment = "${vpc_name}-nat"
  }
}

module "subnets" {
  source = "./subnets"
  region = var.main_region
  vpc_name = var.vpc_name
  vpc_id = aws_vpc.vpc.id
}

module "routing" {
    source = "./routing"
    region = var.main_region
    vpc_name = var.vpc_name
    internet_gateway_id = aws_internet_gateway.ig.id
    nat_gateway_id = aws_nat_gateway.nat.id
}

