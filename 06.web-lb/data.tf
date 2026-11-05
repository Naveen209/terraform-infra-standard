data "aws_ssm_parameter" "public_subnet_ids" {
  name  = "/${var.project_name}/${var.Environment}/public_subnet_ids"
}