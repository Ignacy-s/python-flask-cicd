# Creating an EC2 instance in the Public Subnet
resource "aws_instance" "demoinstance" {
  ami                  = "ami-04e4606740c9c9381"
  instance_type        = "t3.nano"
  key_name             = aws_key_pair.demo_key.key_name
  vpc_security_group_ids = [ aws_security_group.demosg.id ]
  subnet_id            = aws_subnet.demosubnet.id
  associate_public_ip_address = true

  tags = {
    Name = "My Public Instance"
  }
}

resource "aws_key_pair" "demo_key" {
  key_name      = "cicd-project-key"
  public_key    = file("../vault/my_ssh_key_mount/id_25519_aws_flaskcicd.pub")
}


