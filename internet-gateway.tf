resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.private-static-web-vpc.id

  tags = {
    Name = "igw"
  }
}


