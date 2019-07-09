# EC2 Security Group

Configuration in this directory creates set of AWS resources which may be sufficient for a fully working stage or prod
VPC Security Group intended for AWS EC2 instances.

Terraform module which creates EC2-VPC security group within a specific VPC on AWS.
Please check the **input parameters** for a better understanding of it.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Or if using the `Makefile` in this repo you need to execute:

```bash
$ make init
$ make plan
$ make apply
```

Note that this example may create resources which can cost money (AWS EC2, for example). Run `terraform destroy` or `make destroy`
when you don't need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Outputs

| Name | Description |
|------|-------------|
| arn | The ARN of the security group |
| id | The ID of the security group |
| name | The name of the security group |
| owner\_id | The owner ID of the security group |
| vpc\_id | Sec group VPC id |

The module outputs one block, sns_topic. Access it like this:

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

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
