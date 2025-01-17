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
  #   list_network_interface_ids = tolist(aws_vpc_endpoint.s3.network_interface_ids)
  #   subnet_to_network_interface_map = {
  #     for idx, subnet_id in var.subnet_ids : idx => local.list_network_interface_ids[idx]
  #   }
  network_interface_ids_sorted = sort(aws_vpc_endpoint.s3.network_interface_ids)
}
# data "aws_network_interface" "example" {
#   for_each = local.subnet_to_network_interface_map
#   id       = each.value
# }
resource "aws_lb_target_group_attachment" "ip-base-attach" {
  count = length(var.subnet_ids)
  #for_each         = data.aws_network_interface.example
  target_group_arn = aws_lb_target_group.ip-base-TG.arn
  target_id        = local.network_interface_ids_sorted[count.index]
  port             = 80

}