resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.private-static-web-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  route {
    cidr_block = var.vpc-cidrblock
    gateway_id = "local"
  }
  tags = {
    Name = "Public_route_table"
  }
}
resource "aws_route_table_association" "public-table-1" {
  subnet_id      = aws_subnet.public-subnet-az1.id
  route_table_id = aws_route_table.public_route.id
}
resource "aws_route_table_association" "public-table-2" {
  subnet_id      = aws_subnet.public-subnet-az2.id
  route_table_id = aws_route_table.public_route.id
}