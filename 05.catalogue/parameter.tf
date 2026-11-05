resource "aws_ssm_parameter" "catalogue_target_group_id" {
  name  = "/${var.project_name}/${var.Environment}/catalogue_target_group_id"
  type  = "String"
  value = aws_lb_target_group.catalogue.arn
}


