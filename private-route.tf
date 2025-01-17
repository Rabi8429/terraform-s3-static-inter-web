resource "aws_route_table" "private_route" {
  vpc_id = aws_vpc.private-static-web-vpc.id

  route {
    cidr_block = var.vpc-cidrblock
    gateway_id = "local"
  }
  tags = {
    Name = "private_route_table"
  }
}

resource "aws_route_table_association" "private-table-1" {
  subnet_id      = aws_subnet.private-subnet-az1.id
  route_table_id = aws_route_table.private_route.id
}
resource "aws_route_table_association" "private-table-2" {
  subnet_id      = aws_subnet.private-subnet-az2.id
  route_table_id = aws_route_table.private_route.id
}