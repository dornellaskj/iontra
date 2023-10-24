output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "vpc" {
  value = aws_vpc.vpc
}

output "public_routing_table_id" {
  value = aws_route_table.public.id
}

output "private_routing_table_id" {
  value = aws_route_table.public.id
}