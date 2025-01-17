resource "aws_subnet" "private-subnet-az1" {
  vpc_id            = aws_vpc.private-static-web-vpc.id
  cidr_block        = var.private-subnet-cidr_block-az1
  availability_zone = var.az1
  tags = {
    Name = "private-subnet-az1"
    Type = "private"
  }
}
resource "aws_subnet" "private-subnet-az2" {
  vpc_id            = aws_vpc.private-static-web-vpc.id
  cidr_block        = var.private-subnet-cidr_block-az2
  availability_zone = var.az2
  tags = {
    Name = "private-subnet-az2"
  }
}