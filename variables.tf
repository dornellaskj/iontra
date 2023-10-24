variable "main_region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_b_private_cidrs" {
  type    = list(string)
  default = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "vpc_b_public_cidrs" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "vpc_a_private_cidrs" {
  type    = list(string)
  default = ["10.1.4.0/24", "10.1.5.0/24", "10.1.6.0/24"]
}

variable "vpc_a_public_cidrs" {
  type    = list(string)
  default = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
}

variable "vpc_a_cidr" {
  type    = string
  default = "10.1.0.0/16"
}

variable "vpc_b_cidr" {
  type    = string
  default = "10.0.0.0/16"
}