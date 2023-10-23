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