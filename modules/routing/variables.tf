variable "region" {
  type = string
  default = "us-east-1"
}

variable "vpc_name" {
    type = string
    default = "VPC-A"
}

variable "vpc_id" {
  type = string
}

variable "internet_gateway_id" {
    type = string
}

variable "nat_gateway_id" {
    type = string
}

variable "public_subnet_ids"{
  type = list(string)
}
variable "private_subnet_ids"{
  type = list(string)
}

variable "public_subnets_cidrs" {
  type = list(string)
}

variable "private_subnets_cidrs" {
  type = list(string)
}