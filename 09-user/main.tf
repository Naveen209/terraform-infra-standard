module "user" {
  source = "../../terraform-roboshop-app-module"
  project_name = var.project_name
  Environment = var.Environment
  common_tags = var.common_tags
  vpc_id = data.aws_ssm_parameter.vpc_id.id

  #target group
  target_group_protocol = var.target_group_protocol
  target_group_port = var.target_group_port
  #health_check = var.health_check
  
  #launch_template
  image_id = data.aws_ami.ami.id
  key_name = var.key_name
  user_data = filebase64("${path.module}/user.sh")
  security_group_id = data.aws_ssm_parameter.user_sg.value
  launch_template_tags = var.launch_template_tags

  #autoscaling_group
  vpc_zone_identifier = split("," , data.aws_ssm_parameter.private_subnet_ids.value)
  autoscaling_tags = var.autoscaling_tags

  #autoscaling_policy
  # Nothing needed default values would be enough


  #Listener_rule
  aws_lb_listener_arn = data.aws_ssm_parameter.app_lb_listener_arn.value
  aws_lb_listener_priority = var.aws_lb_listener_priority
  host_header = var.host_header

}


