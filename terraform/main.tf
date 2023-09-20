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
  map_public_ip_on_launch = true
  tags = {
    Name = "JenkinsSubnet"
  }
}

resource "aws_internet_gateway" "jenkins" {
  vpc_id = aws_vpc.jenkins.id

  tags = {
    Name = "JenkinsIGW"
  }
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.jenkins.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.jenkins.id
  }

  tags = {
    Name = "Public Subnet Routing Table"
  }
}

resource "aws_route_table_association" "rt_associate_public" {
  subnet_id = aws_subnet.jenkins.id
  route_table_id = aws_route_table.route_table.id
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


# SSH key setup
data "aws_key_pair" "existing" {
  key_name = "cicd-project-key"
}

resource "aws_key_pair" "jenkins-key" {
  count         = data.aws_key_pair.existing != null ? 0 : 1
  key_name      = "cicd-project-key"
  public_key    = file("../vault/id_25519_aws_flaskcicd.pub")
}


resource "aws_instance" "jenkins" {
  ami           = "ami-04e4606740c9c9381"
#  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  key_name      = (data.aws_key_pair.existing != null ?
    data.aws_key_pair.existing.key_name :
    aws_key_pair.jenkins-key[0].key_name)
#    aws_key_pair.jenkins-key[0].key_name

#  key_name      = aws_key_pair.jenkins-key.key_name
  subnet_id     = aws_subnet.jenkins.id
  associate_public_ip_address = true

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

resource "null_resource" "ansible_inventory_edit" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
   command = "bash ${path.module}/add_ip_to_inventory.sh '${aws_instance.jenkins.public_ip}'"
  }
}
