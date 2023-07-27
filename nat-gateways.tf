resource "aws_nat_gateway" "ngw1" {
  allocation_id = aws_eip.nat1.id
  subnet_id     = aws_subnet.public_1.id
  tags = {
    "Name" = "NAT 1"
  }
}

output "nat_values" {
  value     = aws_nat_gateway.ngw1
  sensitive = false
}
