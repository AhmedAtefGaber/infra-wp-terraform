variable "region" {
  type        = string
  description = "Region to deploy resources to"
}

variable "env" {
  type        = string
  description = "Environment to provision the IAC {Dev, UAT or Prod}"
}

variable "eks_name" {
  type        = string
  description = "The name of the EKS cluster"
}

variable "eks_version" {
  type        = string
  description = "The version of the EKS cluster"
}

variable "instance_types" {
  type        = list(string)
  description = "Instance types of nodes in eks"
}

variable "disk_size" {
  type        = number
  description = "The size of Disks of nodes in eks"
}

variable "eks_desired_size" {
  type        = number
  description = "The desired_size of the EKs cluster"
}

variable "eks_min_size" {
  type        = number
  description = "The min_size of the EKs cluster"
}

variable "eks_max_size" {
  type        = number
  description = "The max_size of the EKs cluster"
}

variable "private_nodes_subnet_ids" {
  type        = list(string)
  description = "List of subnet ids of the private nodes"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet ids of the eks cluster"
}
