provider "aws" {
  region = var.main_region
}

module "vpc-B" {
  source               = "./modules/vpc"
  region               = var.main_region
  vpc_name             = "VPC-B"
  public_subnet_cidrs  = var.vpc_b_public_cidrs
  private_subnet_cidrs = var.vpc_b_private_cidrs
  vpc_cidr_block       = var.vpc_b_cidr
}

module "vpc-A" {
  source               = "./modules/vpc"
  region               = var.main_region
  vpc_name             = "VPC-A"
  public_subnet_cidrs  = var.vpc_a_public_cidrs
  private_subnet_cidrs = var.vpc_a_private_cidrs
  vpc_cidr_block       = var.vpc_a_cidr
}