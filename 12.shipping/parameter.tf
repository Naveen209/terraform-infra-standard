resource "aws_ssm_parameter" "shipping_target_group_id" {
  name  = "/${var.project_name}/${var.Environment}/shipping_target_group_id"
  type  = "String"
  value = aws_lb_target_group.main.arn
}

