provider "aws" {
  region = var.main_region
}

module "vpc-B" {
  source = "./modules/vpc"
  region = var.main_region
  vpc_name = "VPC-A"
}

module "vpc-A" {
  source = "./modules/vpc"
  region = var.main_region
  vpc_name = "VPC-B"
}