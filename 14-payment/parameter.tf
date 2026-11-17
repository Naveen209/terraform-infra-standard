resource "aws_ssm_parameter" "payment_target_group_id" {
  name  = "/${var.project_name}/${var.Environment}/payment_target_group_id"
  type  = "String"
  value = aws_lb_target_group.main.arn
}

