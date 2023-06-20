provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "jenkins" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "JenkinsVPC"
  }
}

resource "aws_subnet" "jenkins" {
  vpc_id                  = aws_vpc.jenkins.id
  cidr_block              = "10.0.1.0/24"

  tags = {
    Name = "JenkinsSubnet"
  }
}

resource "aws_security_group" "jenkins" {
  name        = "JenkinsSG"
  description = "Allow Jenkins and SSH traffic"
  vpc_id      = aws_vpc.jenkins.id

  ingress {
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = var.jenkins_server_port
    to_port     = var.jenkins_server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "JenkinsSG"
  }
}

resource "aws_instance" "jenkins" {
  ami           = data.aws_ami.alma_linux_9.id
  instance_type = var.instance_type

#  key_name      = "your_key_pair_name"
  subnet_id     = aws_subnet.jenkins.id

  vpc_security_group_ids = [
    aws_security_group.jenkins.id
  ]

  tags = {
    Name = "JenkinsServer"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo dnf update -y
              EOF
  credit_specification {
    cpu_credits = "standard"
  }
}

output "jenkins_public_ip" {
  value       = aws_instance.jenkins.public_ip
  description = "The public IP address of the server"
}
