resource "aws_vpc_endpoint" "s3" {
  service_name      = "com.amazonaws.us-east-1.s3"
  vpc_endpoint_type = "Interface"
  #dns_record_ip_type = "ipv4"
  vpc_id = aws_vpc.private-static-web-vpc.id
  security_group_ids = [
    aws_security_group.allow_tls.id
  ]
  subnet_ids = [
    aws_subnet.private-subnet-az1.id, aws_subnet.private-subnet-az2.id
  ]

  tags = {
    Environment = "s3-static-web-internal-EP"
  }
}

