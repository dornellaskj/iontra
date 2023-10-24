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

variable "availability_zones" {
  type = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
  validation {
    condition     = length(var.availability_zones) == 3
    error_message = "availability_zones must have count of 3 for high availability"
  }
}