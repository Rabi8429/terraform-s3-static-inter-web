resource "aws_subnet" "public-subnet-az1" {
  vpc_id            = aws_vpc.private-static-web-vpc.id
  cidr_block        = var.public-subnet-cidr_block-az1
  availability_zone = var.az2
  tags = {
    Name = "public-subnet-az1"
  }
}
resource "aws_subnet" "public-subnet-az2" {
  vpc_id            = aws_vpc.private-static-web-vpc.id
  cidr_block        = var.public-subnet-cidr_block-az2
  availability_zone = var.az2
  tags = {
    Name = "public-subnet-az2"
  }
}