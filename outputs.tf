# SG attributes
output "id" {
  description = "The ID of the security group"
  value       = "${aws_security_group.default.id}"
}

output "arn" {
  description = "The ARN of the security group"
  value       = "${aws_security_group.default.arn}"
}

output "owner_id" {
  description = "The owner ID of the security group"
  value       = "${aws_security_group.default.owner_id}"
}

output "name" {
  description = "The name of the security group"
  value       = "${aws_security_group.default.name}"
}

# SG Vpc id
output "vpc_id" {
  description = "Sec group VPC id"
  value       = "${aws_security_group.default.vpc_id}"
}
