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

variable "instance_type" {
  description = "The type of EC2 instance to run Jenkins on"
  type        = string
  default     = "t3.nano"
}

variable "aws_region" {
  description = "The AWS region to use for the project"
  type        = string
  default     = "eu-north-1"
}
