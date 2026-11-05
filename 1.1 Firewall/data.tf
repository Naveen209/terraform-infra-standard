data "aws_vpc" "default" {
  default = true
}

data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project_name}/${var.Environment}/vpc_id"
}

data "http" "my_public_ip" {
  url = "https://ipv4.icanhazip.com"
}

