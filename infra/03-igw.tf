resource "aws_internet_gateway" "igw-iac" {
  vpc_id = aws_vpc.vpc-iac.id

  tags = {
    Name        = "igw-${var.env}-iac"
    Environment = var.env
  }
}