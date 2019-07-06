#
# Security Groups
#
module "sg_private_tcp" {
  source = "../../../terraform-aws-sec-groups"

  security_group_name = "jenkins-vault-private"
  tcp_ports           = "22,80,443,8080,8200,9100"
  udp_ports           = "13000"
  cidrs               = ["172.17.0.0/20"]
  vpc_id              = "vpc-xxxxxxxxxxxxxxxx"

  tags = "${local.tags}"
}

output "sns_topic" {
  value = "${module.sg_private_tcp.id}"
}

# Will output the following:
# sg-xxxxxxxxxxxxxxxxx

