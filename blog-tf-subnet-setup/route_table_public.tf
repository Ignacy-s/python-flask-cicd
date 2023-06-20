# Creating Route Table for Public Subnet
resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.demovpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demogateway.id
  }

  tags = {
    Name = "Public Subnet Routing Table"
  }
}

resource "aws_route_table_association" "rt_associate_public" {
  subnet_id = aws_subnet.demosubnet.id
  route_table_id = aws_route_table.route_table.id
}
