resource "aws_instance" "bastion-iac" {
  ami                    = var.bastion_ami_id
  instance_type          = var.bastion_instance_type
  key_name               = aws_key_pair.bastion-iac.key_name
  user_data              = file("scripts/userdata.sh")
  subnet_id              = aws_subnet.public-me-south-1a.id
  vpc_security_group_ids = [aws_security_group.bastion-iac.id]

  tags = {
    Name        = "bastion-${var.env}-iac"
    Environment = var.env
  }
}

resource "tls_private_key" "bastion-iac" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "bastion-iac" {
  key_name   = "bastion-${var.env}-iac"
  public_key = tls_private_key.bastion-pk-iac.public_key_openssh
  tags = {
    Name        = "bastion-${var.env}-iac"
    Environment = var.env
  }
}

resource "aws_eip" "bastion-iac" {
  vpc = true
  tags = {
    Name        = "bastion-${var.env}-iac"
    Environment = var.env
  }
}

resource "aws_eip_association" "bastion-iac" {
  instance_id   = aws_instance.bastion-iac.id
  allocation_id = aws_eip.bastion-iac.id
}

resource "local_file" "users_keys" {
  content  = "users_keys: ${jsonencode(var.users_keys)}"
  filename = "users_keys.json"
}


resource "null_resource" "users" {

  connection {
    user        = "ec2-user"
    private_key = tls_private_key.bastion-iac.private_key_pem
    agent       = false
    timeout     = "3m"
    host        = aws_eip_association.bastion-iac.public_ip
  }
  triggers = {
    timestamp = "${timestamp()}"
  }

  provisioner "file" {
    source      = "scripts/instance.yaml"
    destination = "/home/ec2-user/instance.yaml"
  }

  provisioner "file" {
    source      = "users_keys.json"
    destination = "/home/ec2-user/users_keys.json"
  }

  provisioner "remote-exec" {
    inline = [
      "cat users_keys.json",
      "sudo cloud-init status --wait",
      "ansible-playbook --extra-vars \"@users_keys.json\" instance.yaml"
    ]
  }

  depends_on = [
    aws_instance.bastion-iac
  ]
}
