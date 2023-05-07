provider "aws" {
  region = "eu-north-1"
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
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
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
  instance_type = "t2.micro"

  key_name      = "your_key_pair_name"
  subnet_id     = aws_subnet.jenkins.id

  vpc_security_group_ids = [
    aws_security_group.jenkins.id
  ]

  tags = {
    Name = "JenkinsServer"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y java-1.8.0-openjdk-devel
              EOF
}

output "jenkins_public_ip" {
  value = aws_instance.jenkins.public_ip
}
