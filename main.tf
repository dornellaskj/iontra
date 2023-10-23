provider "aws" {
  region = var.main_region
}

module "vpc" {
  source = "./modules/vpc"
  region = var.main_region
  vpc_name = "VPC-A"
}

module "vpc" {
  source = "./modules/vpc"
  region = var.main_region
  vpc_name = "VPC-B"
}