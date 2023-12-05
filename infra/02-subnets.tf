resource "aws_subnet" "private-us-east-1a" {
  vpc_id            = aws_vpc.vpc-iac.id
  cidr_block        = var.private_subnet_1a_cidr
  availability_zone = "${var.region}a"

  tags = {
    "Name"                                  = "private-${var.region}a-${var.env}"
    "kubernetes.io/role/internal-elb"       = "1"
    "kubernetes.io/cluster/${var.eks_name}" = "owned"
  }
}

resource "aws_subnet" "private-us-east-1b" {
  vpc_id            = aws_vpc.vpc-iac.id
  cidr_block        = var.private_subnet_1b_cidr
  availability_zone = "${var.region}b"

  tags = {
    "Name"                                  = "private-${var.region}b-${var.env}"
    "kubernetes.io/role/internal-elb"       = "1"
    "kubernetes.io/cluster/${var.eks_name}" = "owned"
  }
}

resource "aws_subnet" "private-us-east-1c" {
  vpc_id            = aws_vpc.vpc-iac.id
  cidr_block        = var.private_subnet_1c_cidr
  availability_zone = "${var.region}c"

  tags = {
    "Name"                                  = "private-${var.region}c-${var.env}"
    "kubernetes.io/role/internal-elb"       = "1"
    "kubernetes.io/cluster/${var.eks_name}" = "owned"
    Environment                             = var.env
  }
}

resource "aws_subnet" "public-us-east-1a" {
  vpc_id                  = aws_vpc.vpc-iac.id
  cidr_block              = var.public_subnet_1a_cidr
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    "Name"                                  = "public-${var.region}a-${var.env}"
    "kubernetes.io/role/elb"                = "1"
    "kubernetes.io/cluster/${var.eks_name}" = "owned"
  }
}

resource "aws_subnet" "public-us-east-1b" {
  vpc_id                  = aws_vpc.vpc-iac.id
  cidr_block              = var.public_subnet_1b_cidr
  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = true

  tags = {
    "Name"                                  = "public-${var.region}b-${var.env}"
    "kubernetes.io/role/elb"                = "1"
    "kubernetes.io/cluster/${var.eks_name}" = "owned"
  }
}

resource "aws_subnet" "public-us-east-1c" {
  vpc_id                  = aws_vpc.vpc-iac.id
  cidr_block              = var.public_subnet_1c_cidr
  availability_zone       = "${var.region}c"
  map_public_ip_on_launch = true

  tags = {
    "Name"                                  = "public-${var.region}c-${var.env}"
    "kubernetes.io/role/elb"                = "1"
    "kubernetes.io/cluster/${var.eks_name}" = "owned"
  }
}
