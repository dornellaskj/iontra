output "private_subnet_ids" {
  value = aws_subnet.private_subnet.*.id
}

output "public_subnet_ids" {
  value = aws_subnet.public_subnet.*.id
}

output "public_subnet_cidrs" {
    value = var.public_subnet_cidrs
}

output "private_subnet_cidrs" {
    value = var.private_subnet_cidrs
}