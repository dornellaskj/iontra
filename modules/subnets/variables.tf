variable "region" {
  type = string
  default = "us-east-1"
}

variable "vpc_name" {
    type = string
    default = "VPC-A"
}

variable "var.vpc_id" {
  type = string
}

variable "availability_zones" {
  type = list(string)
  default = ["${var.region}a", "${var.region}b", "${var.region}c"]
}

variable "public_subnet_cidrs" {
 type        = list(string)
 description = "Public Subnet CIDR values"
 default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}
 
variable "private_subnet_cidrs" {
 type        = list(string)
 description = "Private Subnet CIDR values"
 default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}