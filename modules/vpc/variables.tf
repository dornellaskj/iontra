variable "region" {
  type = string
  default = "us-east-1"
}

variable "vpc_name" {
    type = string
    default = "VPC-A"
}

variable "vpc_cidr_block" {
  type = string
}

variable "public_subnet_cidrs" {
 type        = list(string)
 description = "Public Subnet CIDR values"
}
 
variable "private_subnet_cidrs" {
 type        = list(string)
 description = "Private Subnet CIDR values"
}