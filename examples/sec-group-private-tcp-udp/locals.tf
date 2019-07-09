locals {
  tags = {
    Name        = "infra-test"
    Terraform   = "true"
    Environment = "${var.environment}"
  }
}
