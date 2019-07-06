variable "tcp_ports" {
  description = "A comma separated list of TCP ports from 1-65536 eg: 22,80,443"
  default     = ""
}

variable "udp_ports" {
  description = "A comma separated list of UDP ports from 1-65536 eg: 5001,5002,5003"
  default     = ""
}

variable "cidrs" {
  description = "A comma separated list of CIDR segmemnts eg: [172.16.0.0/20,0.0.0.0/0]"
  type        = "list"
}

variable "security_group_name" {
  description = "The security group name"
}

variable "vpc_id" {
  description = "The VPC id to create the security group in"
}

variable "tags" {
  type        = "map"
  description = "A mapping of tags to assign to all resources"
  default     = {}
}
