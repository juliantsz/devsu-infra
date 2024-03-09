resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = var.security_group_id
  cidr_ipv4         = var.cidr_ipv4
  ip_protocol       = var.ip_protocol
}