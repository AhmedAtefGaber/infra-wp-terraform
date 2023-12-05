resource "aws_eks_cluster" "eks-iac" {
  name     = var.eks_name
  role_arn = aws_iam_role.eks-iac.arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  version = var.eks_version

  depends_on = [aws_iam_role_policy_attachment.eks-iac-AmazonEKSClusterPolicy]
}

data "aws_eks_cluster" "eks-iac" {
  name = aws_eks_cluster.eks-iac.id
}

data "aws_eks_cluster_auth" "eks-iac" {
  name = aws_eks_cluster.eks-iac.id
}
