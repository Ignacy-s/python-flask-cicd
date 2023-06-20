# Creating Security Group
resource "aws_security_group" "demosg" {
  vpc_id           = aws_vpc.demovpc.id
  # HTTP access from anywhere
  ingress {
    from_port      = 80
    to_port        = 80
    protocol       = "tcp"
    cidr_blocks    = ["0.0.0.0/0"]
  }
  # HTTPS access from anywhere
  ingress {
    from_port      = 443
    to_port        = 443
    protocol       = "tcp"
    cidr_blocks    = ["0.0.0.0/0"]
  }
  # SSH access from anywhere
  ingress {
    from_port      = 22
    to_port        = 22
    protocol       = "tcp"
    cidr_blocks    = ["0.0.0.0/0"]
  }
  # Allow all outward traffic
  egress {
    from_port      = 0
    to_port        = 0
    protocol       = "-1"
    cidr_blocks    = ["0.0.0.0/0"]
  }
}
