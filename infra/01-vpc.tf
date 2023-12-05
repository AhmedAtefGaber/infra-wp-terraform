resource "aws_vpc" "vpc-iac" {
  cidr_block = var.vpc_cidr

  tags = {
    Name        = "vpc-${var.env}-iac"
    Environment = var.env
  }
}