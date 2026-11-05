data "aws_ssm_parameter" "vpc_id" {
  name  = "/${var.project_name}/${var.Environment}/vpc_id"
}

data "aws_ssm_parameter" "catalogue_sg" {
 name  = "/${var.project_name}/${var.Environment}/catalogue_sg"
}

data "aws_ami" "ami" {
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
data "aws_ssm_parameter" "private_subnet_ids" {
 name  = "/${var.project_name}/${var.Environment}/private_subnet_ids"
}
data "aws_ssm_parameter" "aws_lb_listener_arn" {
 name  = "/${var.project_name}/${var.Environment}/app_lb_listener_arn"
}
