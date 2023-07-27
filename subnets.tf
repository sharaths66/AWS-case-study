resource "aws_subnet" "public_1" {
  vpc_id = aws_vpc.main.id

  cidr_block        = "192.168.0.0/18"
  availability_zone = "ap-south-1a"

  tags = {
    "Name" = "public-ap-south-1a"
  }
}

resource "aws_subnet" "private_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "192.168.128.0/18"
  availability_zone = "ap-south-1a"

  tags = {
    "Name"                            = "private-ap-south-1a"
    "kubernetes.io/cluster/eks"       = "shared"
    "kubernetes.io/role/internal-elb" = 1 # For private load balancer
  }
}

output "subnet_values_private" {
  value = aws_subnet.private_1.id
}
output "subnet_values_public" {
  value = aws_subnet.public_1.id
}
output "other_subnets" {
  value = [aws_subnet.private_1, aws_subnet.public_1.id]
}
