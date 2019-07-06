#
# Security Groups
#
module "sg_public_tcp" {
  source = "../../../terraform-aws-sec-groups"

  security_group_name = "vpn-public"
  tcp_ports           = "443"
  cidrs               = ["172.17.0.0/20"]
  vpc_id              = "vpc-xxxxxxxxxxxxxxxx"

  tags = "${local.tags}"
}

output "sns_topic" {
  value = "${module.sg_public_tcp.id}"
}

# Will output the following:
# sg-xxxxxxxxxxxxxxxxx

