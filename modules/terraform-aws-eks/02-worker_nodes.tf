resource "aws_eks_node_group" "eks-private-nodes-iac" {
  cluster_name    = aws_eks_cluster.eks-iac.id
  node_group_name = "private-nodes-${var.eks_name}"
  node_role_arn   = aws_iam_role.eks-node-group-iac.arn

  subnet_ids = var.private_nodes_subnet_ids

  capacity_type  = "ON_DEMAND"
  instance_types = var.instance_types
  disk_size      = var.disk_size

  scaling_config {
    desired_size = var.eks_desired_size
    max_size     = var.eks_max_size
    min_size     = var.eks_min_size
  }

  update_config {
    max_unavailable = 1
  }

  labels = {
    role = "private-nodes"
  }

  depends_on = [
    aws_iam_role_policy_attachment.nodes-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.nodes-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.nodes-AmazonEC2ContainerRegistryReadOnly,
  ]
}
