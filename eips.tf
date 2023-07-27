resource "aws_eip" "nat1" {
  depends_on = [aws_internet_gateway.main]
}

output "eips" {
  value     = aws_eip.nat1
  sensitive = false
}
