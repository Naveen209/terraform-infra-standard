data "aws_ssm_parameter" "app_lb_sg" {
  name  = "/${var.project_name}/${var.Environment}/app_lb_sg"
}

data "aws_ssm_parameter" "private_subnet_ids" {
  name  = "/${var.project_name}/${var.Environment}/private_subnet_ids"
}


