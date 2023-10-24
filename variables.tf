variable "main_region" {
  type    = string
  default = "us-east-1"
  validation {
    condition     = can(regex("[a-z][a-z]-[a-z]+-[1-9]", var.main_region))
    error_message = "main_region must be valid AWS Region name."
  }
}

variable "vpc_b_private_cidrs" {
  type    = list(string)
  default = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  validation {
    condition     = can([for s in var.vpc_b_private_cidrs : cidrhost(s, 0)])
    error_message = "Each item of the 'vpc_b_private_cidrs' List must be in a CIDR block format."
  }
  validation {
    condition     = length(var.vpc_b_private_cidrs) == 3
    error_message = "vpc_b_private_cidrs must have count of 3 for high availability"
  }
}

variable "vpc_b_public_cidrs" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  validation {
    condition     = can([for s in var.vpc_b_public_cidrs : cidrhost(s, 0)])
    error_message = "Each item of the 'vpc_b_public_cidrs' List must be in a CIDR block format. Example: [\"10.106.108.0/25\"]."
  }
  validation {
    condition     = length(var.vpc_b_public_cidrs) == 3
    error_message = "vpc_b_public_cidrs must have count of 3 for high availability"
  }
}

variable "vpc_a_private_cidrs" {
  type    = list(string)
  default = ["10.1.4.0/24", "10.1.5.0/24", "10.1.6.0/24"]
  validation {
    condition     = can([for s in var.vpc_a_private_cidrs : cidrhost(s, 0)])
    error_message = "Each item of the 'vpc_a_private_cidrs' List must be in a CIDR block format. Example: [\"10.106.108.0/25\"]."
  }
  validation {
    condition     = length(var.vpc_a_private_cidrs) == 3
    error_message = "vpc_a_private_cidrs must have count of 3 for high availability"
  }
}

variable "vpc_a_public_cidrs" {
  type    = list(string)
  default = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
  validation {
    condition     = can([for s in var.vpc_a_public_cidrs : cidrhost(s, 0)])
    error_message = "Each item of the 'vpc_a_public_cidrs' List must be in a CIDR block format."
  }
  validation {
    condition     = length(var.vpc_a_public_cidrs) == 3
    error_message = "vpc_a_public_cidrs must have count of 3 for high availability"
  }
}

variable "vpc_a_cidr" {
  type    = string
  default = "10.1.0.0/16"
  validation {
    condition     = can(cidrhost(var.vpc_a_cidr, 0))
    error_message = "vpc_a_cidr must be valid IPv4 CIDR."
  }
}

variable "vpc_b_cidr" {
  type    = string
  default = "10.0.0.0/16"
  validation {
    condition     = can(cidrhost(var.vpc_b_cidr, 0))
    error_message = "vpc_a_cidr must be valid IPv4 CIDR."
  }
}
