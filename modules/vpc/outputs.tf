output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "public_routing_table_id" {
  value = module.routing.private_routing_table_id
}

output "private_routing_table_id" {
  value = module.routing.private_routing_table_id
}