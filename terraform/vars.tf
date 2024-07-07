/* Provider variable */
variable "aws_region" {
  description = "The AWS region to use for the project"
  type        = string
  default     = "eu-north-1"
}

/* Networking variables */
variable "all_ips_cidr" {
  description = "CIDR that matches all IP addresses, a Wildcard CIDR"
  type        = string
  default     = "0.0.0.0/0"
}

variable "vpc_cidr_block" {
  description = "CIDR range/block for the main VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "Name of the main VPC"
  type        = string
  default     = "JenkinsVPC"
}

variable "public_subnet_cidr_block" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "is_public_subnet_public" {
  description = "If instances in this subnet should get public IP"
  type        = bool
  default     = true
}

variable "public_subnet_name" {
  description = "Name assigned to the public subnet"
  type        = string
  default     = "JenkinsSubnet"
}


variable "jenkins_server_port" {
  description = "The port Jenkins will use for web traffic"
  type        = number
  default     = 8080
}

variable "ssh_port" {
  description = "The port for SSH connections"
  type        = number
  default     = 22
}

variable "internet_gateway_name" {
  description = ""
  type        = string
  default     = "JenkinsIGW"
}

variable "public_subnet_routing_table_name" {
  description = "Name assigned to the public subnet routing table"
  type        =  string
  default     = "Public Subnet Routing Table"
}

variable "security_group_name" {
  description = "Name assigned to the Jenkin's security group"
  type        = string
  default     = "JenkinsSG"
}

/* Variables for EC2 Setup */
variable "instance_type" {
  description = "The type of EC2 instance to run Jenkins on"
  type        = string
  default     = "t3.nano"
}

variable "ssh_key_name" {
  description = "Name for SSH key, accessible from other TF modules"
  type        = string
  default     = "cicd-project-key"
}

variable "local_ssh_key_path" {
  description = "Path to the SSH key to be uploaded to AWS"
  type        = string
  default     = ("../vault/id_25519_aws_flaskcicd.pub")
}

variable "jenkins_instance_name" {
  description = "Name for Jenkins instance, usable from other TF modules"
  type        = string
  default     = "JenkinsServer"
}
