<div align="center">
    <img src="https://binbashar.github.io/terraform-aws-sec-groups/figures/binbash.png" alt="drawing" width="350"/>
</div>
<div align="right">
  <img src="https://binbashar.github.io/terraform-aws-sec-groups/figures/binbash-leverage-terraform.png" alt="leverage" width="230"/>
</div>

# AWS VPC Security Group: terraform-aws-sec-groups

Terraform module which creates EC2-VPC security group within a specific VPC on AWS.
Please check the **input parameters** for a better understanding of it.

It was developed in order to work in composition with the following terraform modules:
- https://github.com/binbashar/terraform-aws-pritunl-openvpn
- https://github.com/binbashar/terraform-aws-jenkins-vault

## Releases
- **Versions:** `<= 0.x.y` (Terraform 0.11.x compatible)
    - eg: https://registry.terraform.io/modules/binbashar/ec2-jenkins-vault/aws/0.0.1

- **Versions:** `>= 1.x.y` (Terraform 0.12.x compatible -> **WIP**)
    - eg: https://registry.terraform.io/modules/binbashar/ec2-jenkins-vault/aws/1.0.0

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cidrs | A comma separated list of CIDR segmemnts eg: [172.16.0.0/20,0.0.0.0/0] | list | n/a | yes |
| security\_group\_name | The security group name | string | n/a | yes |
| tags | A mapping of tags to assign to all resources | map | `<map>` | no |
| tcp\_ports | A comma separated list of TCP ports from 1-65536 eg: 22,80,443 | string | `""` | no |
| udp\_ports | A comma separated list of UDP ports from 1-65536 eg: 5001,5002,5003 | string | `""` | no |
| vpc\_id | The VPC id to create the security group in | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| arn | The ARN of the security group |
| id | The ID of the security group |
| name | The name of the security group |
| owner\_id | The owner ID of the security group |
| vpc\_id | Sec group VPC id |

## Examples
### For Private Security Groups
#### sec-group-private-tcp
```terraform
#
# Security Groups
#
module "sg_private_tcp" {
  source = "../../../terraform-aws-sec-groups"

  security_group_name = "jenkins-vault-private"
  tcp_ports           = "22,80,443,8080,8200,9100"
  cidrs               = ["172.17.0.0/20"]
  vpc_id              = "vpc-xxxxxxxxxxxxxxxx"

  tags = "${local.tags}"
}

output "sns_topic" {
  value = "${module.sg_private_tcp.id}"
}

# Will output the following:
# sg-xxxxxxxxxxxxxxxxx
```

#### sec-group-private-tcp-udp
``` terraform
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
```

### For Public Security Groups
#### sec-group-public-tcp
```terraform
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
```

#### sec-group-public-tcp-udp
``` terraform
#
# Security Groups
#
module "sg_public_tcp_udp" {
  source = "../../../terraform-aws-sec-groups"

  security_group_name = "vpn-public"
  tcp_ports           = "443"
  udp_ports           = "15255,15256"
  cidrs               = ["172.17.0.0/20"]
  vpc_id              = "vpc-xxxxxxxxxxxxxxxx"

  tags = "${local.tags}"
}

output "sns_topic" {
  value = "${module.sg_public_tcp_udp.id}"
}

# Will output the following:
# sg-xxxxxxxxxxxxxxxxx
```
