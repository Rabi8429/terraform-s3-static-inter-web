resource "aws_vpc" "private-static-web-vpc" {
  cidr_block = var.vpc-cidrblock

  tags = {
    Name = "s3-private-static-web-vpc"
  }
}
