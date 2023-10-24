resource "aws_vpc_peering_connection" "A2B" {
  vpc_id      = module.vpc-A.vpc_id
  peer_vpc_id = module.vpc-B.vpc_id
  auto_accept = true
}

resource "aws_route" "vpc_a_public_to_vpc_b_private" {
  route_table_id            = module.vpc-A.public_routing_table_id
  count                     = length(var.vpc_b_private_cidrs)
  destination_cidr_block    = element(var.vpc_b_private_cidrs, count.index)
  vpc_peering_connection_id = aws_vpc_peering_connection.A2B.id
}