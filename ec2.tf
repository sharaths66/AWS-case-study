resource "aws_instance" "case-1" {
  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_1.id
  vpc_security_group_ids = [aws_security_group.ec2-case-1.id]

  tags = {
    Name = "case-1"
  }

  provisioner "remote-exec" {
      inline = [
          "apt-get update",
          "apt-get install -y nginx",
          "service nginx start"
      ]
  }
}

resource "aws_security_group" "ec2-case-1" {
    name="ec2-case-1"
    vpc_id = aws_vpc.main.id

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
