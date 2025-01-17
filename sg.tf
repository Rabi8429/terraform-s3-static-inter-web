resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.private-static-web-vpc.id

  tags = {
    Name = "s3-static-internal-web-SG"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ipv4_http" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.internet_cidr
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}
resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.internet_cidr
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.internet_cidr
  ip_protocol       = "-1" # semantically equivalent to all ports
}