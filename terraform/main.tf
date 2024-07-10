/* Create infra for Jenkins VM */

# Set aws provider with region from vars.tf
provider "aws" {
  region = var.aws_region
}

# Setup a VPC for Jenkins project with a CIDR block
resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = var.vpc_name
  }
}

# Define a public subnet in our VPC.
# Instances in this subnet will receive a public IP address on launch
# to allow direct Internet access, necessary for initial configuration
# and remote management.
resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.main_vpc.id
  # A CIDR block for subnet that must be within the VPC CIDR block
  cidr_block = var.public_subnet_cidr_block
  # Setting responsible for public IP assignment
  map_public_ip_on_launch = var.is_public_subnet_public
  tags = {
    # Name used to refer to this subnet from other TF modules/projects
    Name = var.public_subnet_name
  }
}

# Define a gateway for our VPC
# Gateway is needed to exchange traffic with the outside.
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    # This name can be used to refer to this IGW from other TF modules
    Name = var.internet_gateway_name
  }
}

# Create a public routing table for our VPC for traffic to/from
# outside and trough our new public gateway
resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    # The default route for all outgoing
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = var.public_subnet_routing_table_name
  }
}

# Associate our public subnet with the public routing table
resource "aws_route_table_association" "rt_associate_public" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.route_table.id
}

# Security Group for specific traffic:
#  - SSH traffic for remote management.
#  - HTTPS traffic for secure Jenkins access.
# Security group is a sort of firewall.

resource "aws_security_group" "jenkins" {
  name        = var.security_group_name
  description = "Allow Jenkins and SSH traffic"
  vpc_id      = aws_vpc.main_vpc.id

  # for SSH traffic
  ingress {
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # for HTTPS traffic to the Jenkins server
  ingress {
    from_port   = var.jenkins_server_port
    to_port     = var.jenkins_server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # typical entry for outgoing traffic with "any" (-1) protocol
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.security_group_name
  }
}

# Create an SSH key from a local file
resource "aws_key_pair" "jenkins-key" {
  key_name   = var.ssh_key_name
  public_key = file(var.local_ssh_key_path)
}

# Create an EC2 instance for the Jenkins Server
resource "aws_instance" "jenkins" {
  # Using a hardcoded AMI for Alma Linux for quick setup.  TODO:
  # Automate AMI selection to dynamically pick the latest stable
  # release.
  ami = "ami-04e4606740c9c9381"
  #  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  # Assign the correct SSH key dynamically
  # If an existing key is available, it is used;
  # otherwise, a newly created key (from this Terraform configuration)
  # is applied. This ensures that the instance uses a valid key pair
  # for SSH access.
  # Why 'jenkins-key[0]' instead of 'jenkins-key'? Because 'count' was
  # used to create that resource and all resources created by 'count'
  # are treated as lists, even if it's just one resource.
  # key_name = (data.aws_key_pair.existing != null ?
  #   data.aws_key_pair.existing.key_name :
  # aws_key_pair.jenkins-key[0].key_name)
  key_name = aws_key_pair.jenkins-key.key_name
  
  subnet_id = aws_subnet.public_subnet.id
  # Associate a public IP to allow direct Internet access
  associate_public_ip_address = true

  # Attach the security group defined earlier, with HTTPS and SSH
  # traffic allowed.
  vpc_security_group_ids = [
    aws_security_group.jenkins.id
  ]

  tags = {
    Name = var.jenkins_instance_name
  }

  user_data = <<-EOF
              #!/bin/bash
              # Update all system packages on launch
              sudo dnf update -y
              EOF

  # Standard credit setting disallows CPU bursting above the accrued
  # limit, avoiding extra costs from the default 'unlimited' setting.
  credit_specification {
    cpu_credits = "standard"
  }
}

output "jenkins_public_ip" {
  value       = aws_instance.jenkins.public_ip
  description = "The public IP address of the server"
}


# Using "null_resource" to run a script to update ansible inventory
# with the IP address of the newly created machine.
resource "null_resource" "ansible_inventory_edit" {
  triggers = {
    # This is a trick to ALWAYS run this resource
    always_run = "${timestamp()}"
    # This shows an error:  main.tf   180  18 warning  terraform_deprecated_interpolation Interpolation-only expressions are deprecated in Terraform v0.12.14 (terraform-tflint)
  }

  # This command will run a script, which updates the IP address in
  # the Ansible inventory file. 
  provisioner "local-exec" {
    command = <<-EOF
       bash "${path.module}/add_ip_to_inventory.sh" \
         "${aws_instance.jenkins.public_ip}"
       EOF
  }
}
