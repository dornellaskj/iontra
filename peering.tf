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

resource "aws_network_acl_rule" "VPCa_ingress" {
  network_acl_id = module.vpc-B.vpc_id.default_network_acl_id
  count       = length(var.vpc_a_public_cidrs)
  rule_number = "${5 + count.index}"
  egress      = false
  protocol    = "tcp"
  rule_action = "allow"
  cidr_block  = element(var.vpc_a_public_cidrs, count.index)
  from_port   = 80
  to_port     = 80
}

resource "aws_network_acl_rule" "VPCa_egress" {
  network_acl_id = module.vpc-B.vpc_id.default_network_acl_id
  count       = length(var.vpc_a_public_cidrs)
  rule_number = "${5 + count.index}"
  egress      = true
  protocol    = "tcp"
  rule_action = "allow"
  cidr_block  = element(var.vpc_a_public_cidrs, count.index)
  from_port   = 80
  to_port     = 80
}

resource "aws_network_acl_rule" "VPCa_ingress_deny" {
  network_acl_id = module.vpc-B.vpc_id.default_network_acl_id
  count       = length(var.vpc_a_public_cidrs)
  rule_number = "${1000 + count.index}"
  egress      = false
  protocol    = -1
  rule_action = "deny"
  cidr_block  = element(var.vpc_a_public_cidrs, count.index)
}

resource "aws_network_acl_rule" "VPCa_egress_deny" {
  network_acl_id = module.vpc-B.vpc_id.default_network_acl_id
  count       = length(var.vpc_a_public_cidrs)
  rule_number = "${1000 + count.index}"
  egress      = true
  protocol    = -1
  rule_action = "deny"
  cidr_block  = element(var.vpc_a_public_cidrs, count.index)
}