
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_internet_gateway" "ig" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags = {
    Name = "${var.vpc_name}-igw"
  }
}

resource "aws_eip" "nat_eip" {
  depends_on = [aws_internet_gateway.ig]
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id      = "${element(module.subnets.public_subnet_ids, 0)}"
  depends_on    = [aws_internet_gateway.ig]
  tags = {
    Name        = "nat"
    Environment = "${var.vpc_name}-nat"
  }
}

module "subnets" {
  source = "../subnets"
  region = var.region
  vpc_name = var.vpc_name
  vpc_id = aws_vpc.vpc.id
  internet_gateway_id = aws_internet_gateway.ig.id
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "routing" {
    source = "../routing"
    region = var.region
    vpc_name = var.vpc_name
    vpc_id = aws_vpc.vpc.id
    internet_gateway_id = aws_internet_gateway.ig.id
    nat_gateway_id = aws_nat_gateway.nat.id
    private_subnet_ids = module.subnets.private_subnet_ids
    public_subnet_ids = module.subnets.public_subnet_ids
    public_subnets_cidrs = module.subnets.public_subnet_cidrs
    private_subnets_cidrs = module.subnets.private_subnet_cidrs
}

