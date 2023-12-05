resource "aws_route_table" "rtb-private-iac" {
  vpc_id = aws_vpc.vpc-iac.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gw-iac.id
  }

  tags = {
    Name        = "private-${var.env}-iac"
    Environment = var.env
  }
}

resource "aws_route_table" "rtb-public-iac" {
  vpc_id = aws_vpc.vpc-iac.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-iac.id
  }

  tags = {
    Name        = "public-${var.env}-iac"
    Environment = var.env
  }
}


resource "aws_route_table_association" "private-us-east-1a" {
  subnet_id      = aws_subnet.private-us-east-1a.id
  route_table_id = aws_route_table.rtb-private-iac.id
}

resource "aws_route_table_association" "private-us-east-1b" {
  subnet_id      = aws_subnet.private-us-east-1b.id
  route_table_id = aws_route_table.rtb-private-iac.id
}

resource "aws_route_table_association" "private-us-east-1c" {
  subnet_id      = aws_subnet.private-us-east-1c.id
  route_table_id = aws_route_table.rtb-private-iac.id
}

resource "aws_route_table_association" "public-us-east-1a" {
  subnet_id      = aws_subnet.public-us-east-1a.id
  route_table_id = aws_route_table.rtb-public-iac.id
}

resource "aws_route_table_association" "public-us-east-1b" {
  subnet_id      = aws_subnet.public-us-east-1b.id
  route_table_id = aws_route_table.rtb-public-iac.id
}

resource "aws_route_table_association" "public-us-east-1c" {
  subnet_id      = aws_subnet.public-us-east-1c.id
  route_table_id = aws_route_table.rtb-public-iac.id
}
