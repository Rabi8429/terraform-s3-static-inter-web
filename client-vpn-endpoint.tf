# resource "aws_ec2_client_vpn_endpoint" "example" {
#   description            = "terraform-clientvpn-example"
#   server_certificate_arn = var.server-certificatecert-arn
#   client_cidr_block      = var.client_cidr_block
#   vpc_id                 = aws_vpc.private-static-web-vpc.id
#   split_tunnel           = true
#   transport_protocol     = "tcp"
#   authentication_options {
#     type                       = "certificate-authentication"
#     root_certificate_chain_arn = var.root-certificate-arn
#   }

#     connection_log_options {
#       enabled               = true
#       cloudwatch_log_group  = aws_cloudwatch_log_group.lg.name
#     #   cloudwatch_log_stream = aws_cloudwatch_log_stream.ls.name
#     }
# }
# resource "aws_cloudwatch_log_group" "lg" {
#   name = "lg"

#   tags = {
#     Environment = "production"
#     Application = "serviceA"
#   }
# }



############################################
# avobe code working fine but it's not connect 
# That's why i am import to existing client VPN
####################################################

