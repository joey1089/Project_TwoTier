# --- ec2-instance/main.tf ---

data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}


# Create Key pair
resource "aws_key_pair" "TF_key" {
  key_name   = var.key_name_var
  public_key = tls_private_key.rsa.public_key_openssh
  # public_key = file(var.public_key_path)

}

resource "tls_private_key" "rsa" {
  algorithm = var.algorithm_type
  rsa_bits  = 4096
}

resource "local_file" "TF-key" {
  content = tls_private_key.rsa.private_key_pem
  # filename = "tfkey-${substr(uuid(), 1, 2)}"
  filename = var.key_name_var
}