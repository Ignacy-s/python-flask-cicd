# Defining CIDR block for VPC
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

# Defining CIDR block for the Public Subnet
variable "subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "aws_region" {
  description = "The AWS region to use for the project"
  type        = string
  default     = "eu-north-1"
}
