resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}
output "value_of_ig" {
  value       = aws_internet_gateway.main.id
  description = "value of IG"
  sensitive   = false
}
