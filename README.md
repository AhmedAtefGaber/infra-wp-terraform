## Provisioning infrastructure on AWS using Terraform  
This project is intended to provision a whole infrastructure on AWS for a containerized application.

###### The structure of the project is divided into infra and modules.
### [infra](./infra/): 
This is where we define all the resources will be deployed from VPC, Subnets, IGW, NAtT gateway, EKS,...etc.
### [modules](./modules/): 
It contains the modules used through out the infra.

### [infra](./infra/)
The structure of infra is further divided into several .tf files, each one has a specific purpose.
- [01-vpc.tf](./infra/01-vpc.tf): Defines the VPC.
- [02-subnets.tf](./infra/01-vpc.tf): Defines the subnets.
- [03-igw.tf](./infra/03-igw.tf): Defines the Internet Gateway.
- [04-nat_gateway.tf](./infra/04-nat_gateway.tf): Defines the NAT gateways and Elastic IP addresses.
- [05-route_tables.tf](./infra/05-route_tables.tf): Defines the route tables and the route tables associations.
- [06-sg.tf](./infra/06-sg.tf): Defines the security groups.
- [07-eks.tf](./infra/07-eks.tf): Defines the EKS cluster, .
- [08-helm.tf](./infra/08-helm.tf): Defines the helm charts.
- [09-bastion.tf](./infra/09-bastion.tf): Defines the bastion host.
- [10-route53.tf](./infra/10-route53.tf): Defines the DNS entries in route53.
- [providers.tf](./infra/providers.tf): Defines the providers and their configurations.
- [variables.tf](./infra/variables.tf): Contains all the variable declarations used.
- [outputs.tf](./infra/variables.tf): Contains the output declarations.
##### [Scripts](./infra/scripts/):
- [instance.yaml](./infra/scripts/instance.yaml): An Ansible playbook to create users and add their ssh keys on the bastion host. 
- [userdata.sh](./infra/scripts/userdata.sh): A user data script for the bastion ec2 instance to be run after it starts.

### [modules](./modules/)
[terraform-aws-eks](./terraform-aws-eks): This module is used to create the EKS cluster, the IAM roles, Worker nodes, the Autoscaling, ...etc.
The structure of the module is further divided into several .tf files, each one has a specific purpose.
- [main.tf](./modules/terraform-aws-eks/main.tf): Defines the EKS cluster.
- [01-iam_roles.tf](./modules/terraform-aws-eks/01-iam_roles.tf): Defines the for EKS and worker nodes.
- [02-worker_nodes.tf](./modules/terraform-aws-eks/02-worker_nodes.tf): Defines the worker nodes.
- [03-autoscaler.tf](./modules/terraform-aws-eks/03-autoscaler.tf): Defines the resources needed for the autoscaler
- [variables.tf](./modules/terraform-aws-eks/variables.tf): Contains all the variable declarations used in the module.
- [outputs.tf](./modules/terraform-aws-eks/outputs.tf): Contains the output declarations.
