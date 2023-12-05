resource "aws_security_group" "bastion-iac" {
  name        = "bastion-${var.env}-iac"
  description = "Allow bastion"
  vpc_id      = aws_vpc.vpc-iac.id

  ingress {
    description      = "Allow ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name        = "bastion-${var.env}-iac"
    Environment = var.env
  }
}
