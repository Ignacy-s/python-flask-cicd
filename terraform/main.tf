/* Create infra for Jenkins VM */

# Set aws provider with region from vars.tf
provider "aws" {
  region = var.aws_region
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
  ami = "ami-0b8fd93c15b2c81ce"
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
