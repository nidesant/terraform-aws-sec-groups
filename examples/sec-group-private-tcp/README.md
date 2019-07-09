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

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

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
