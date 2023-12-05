module "eks" {
  source                   = "app.terraform.io/Atef-Dev/eks/aws"
  version                  = "1.1.3"
  region                   = var.region
  env                      = var.env
  eks_name                 = var.eks_name
  eks_version              = var.eks_version
  instance_types           = var.instance_types
  disk_size                = var.disk_size
  eks_desired_size         = var.eks_desired_size
  eks_min_size             = var.eks_min_size
  eks_max_size             = var.eks_max_size
  private_nodes_subnet_ids = [data.terraform_remote_state.network.outputs.private_subnet_a, data.terraform_remote_state.network.outputs.private_subnet_b, data.terraform_remote_state.network.outputs.private_subnet_c]
  subnet_ids               = [data.terraform_remote_state.network.outputs.private_subnet_a, data.terraform_remote_state.network.outputs.private_subnet_b, data.terraform_remote_state.network.outputs.private_subnet_c, data.terraform_remote_state.network.outputs.public_subnet_a, data.terraform_remote_state.network.outputs.public_subnet_b, data.terraform_remote_state.network.outputs.public_subnet_c]
}
