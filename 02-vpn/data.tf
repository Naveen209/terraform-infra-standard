data "aws_vpc" "default" {
  default = true
}

data "http" "my_public_ip" {
  url = "https://ipv4.icanhazip.com"
}

data "aws_ami" "vpn" {
  most_recent      = true
  name_regex       = "CentOS-Stream-9-20250604.1.x86_64-aba856bc-78bf-441c-b25c-980bec33a53f-ami-026f58654c57bc7b7.4"
  owners           = ["679593333241"]

  filter {
    name   = "name"
    values = ["CentOS-Stream-9-20250604.1.x86_64-aba856bc-78bf-441c-b25c-980bec33a53f-ami-026f58654c57bc7b7.4"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}
data "aws_ssm_parameter" "vpn_sg" {
  name = "/${var.project_name}/${var.Environment}/vpn_sg"
}
