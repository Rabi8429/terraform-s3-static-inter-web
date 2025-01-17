#### This for VPC endpoint private ips attached with Target Group ####################


resource "aws_lb_target_group" "ip-base-TG" {
  name             = "s3-static-internal-web-tg"
  port             = 80
  protocol         = "HTTP"
  target_type      = "ip"
  vpc_id           = aws_vpc.private-static-web-vpc.id
  protocol_version = "HTTP1"
  health_check {
    enabled  = true
    protocol = "HTTP"
    port     = 80
    matcher  = "307,405"
  }
  depends_on = [aws_vpc_endpoint.s3]
}

locals {
  network_interface_ids_sorted = sort(aws_vpc_endpoint.s3.network_interface_ids)
}

resource "aws_lb_target_group_attachment" "test" {
  count = length(aws_vpc_endpoint.s3.network_interface_ids)
  target_group_arn = aws_lb_target_group.ip-base-TG.arn
  target_id        = data.aws_network_interface.eni_info[count.index].private_ip
  port             = 80
}