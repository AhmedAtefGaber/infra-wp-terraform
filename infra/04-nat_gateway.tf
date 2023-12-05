resource "aws_eip" "eip-iac" {
  vpc = true

  tags = {
    Name        = "eip-${var.env}-iac"
    Environment = var.env
  }
}

resource "aws_nat_gateway" "nat-gw-iac" {
  allocation_id = aws_eip.eip-iac.id
  subnet_id     = aws_subnet.public-us-east-1b.id

  tags = {
    Name        = "nat-gw-${var.env}-iac"
    Environment = var.env
  }

  depends_on = [aws_internet_gateway.igw-iac]
}