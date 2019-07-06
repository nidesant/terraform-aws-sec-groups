provider "aws" {
  region  = "us-east-1"
  profile = "${var.aws_profile}"
}

variable "aws_profile" {
  default = "dev"
}

variable "environment" {
  default = "development"
}

locals {
  tags = {
    Name        = "infra-jenkinsvault"
    Terraform   = "true"
    Environment = "${var.environment}"
  }
}
