# resource “aws_lb_target_group” “ip-example” {
# name = “tf-example-lb-tg”
# port = 443
# protocol = “HTTPS”
# target_type = “ip”
# vpc_id = var.vpc_id

# health_check {
# enabled = true
# protocol = “HTTP”
# port = 80
# matcher = “200,307,405”
# }

# depends_on = [ aws_vpc_endpoint.s3 ]
# }

# locals {
# list_network_interface_ids = tolist(aws_vpc_endpoint.s3.network_interface_ids)
# subnet_to_network_interface_map = {
# for idx, subnet_id in var.subnet_ids : idx => local.list_network_interface_ids[idx]
# }
# }

# data “aws_network_interface” “example”{
# for_each = local.subnet_to_network_interface_map
# id = each.value
# }

# resource “aws_lb_target_group_attachment” “test_0” {

# depends_on = [ aws_vpc_endpoint.s3 ]
# for_each = data.aws_network_interface.example
# target_group_arn = aws_lb_target_group.ip-example.arn
# target_id = each.value.private_ip
# port = 443

# }