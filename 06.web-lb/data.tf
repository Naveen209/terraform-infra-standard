data "aws_ssm_parameter" "public_subnet_ids" {
  name  = "/${var.project_name}/${var.Environment}/public_subnet_ids"
}

data "aws_ssm_parameter" "web_lb_sg" {
  name  = "/${var.project_name}/${var.Environment}/web_lb_sg"
}
