resource "aws_ssm_parameter" "vpn_sg" {
    name  = "/${var.project_name}/${var.Environment}/vpn_sg"
    type  = "String"
    value = module.vpn_sg.sg_id  
}

resource "aws_ssm_parameter" "mongodb_sg" {
    name  = "/${var.project_name}/${var.Environment}/mongodb_sg"
    type  = "String"
    value = module.mongodb_sg.sg_id  
}

resource "aws_ssm_parameter" "mysql_sg" {
    name  = "/${var.project_name}/${var.Environment}/mysql_sg"
    type  = "String"
    value = module.mysql_sg.sg_id  
}

resource "aws_ssm_parameter" "redis_sg" {
    name  = "/${var.project_name}/${var.Environment}/redis_sg"
    type  = "String"
    value = module.redis_sg.sg_id  
}

resource "aws_ssm_parameter" "rabbitmq_sg" {
    name  = "/${var.project_name}/${var.Environment}/rabbitmq_sg"
    type  = "String"
    value = module.rabbitmq_sg.sg_id  
}


resource "aws_ssm_parameter" "catalogue_sg" {
    name  = "/${var.project_name}/${var.Environment}/catalogue_sg"
    type  = "String"
    value = module.catalogue_sg.sg_id  
}

resource "aws_ssm_parameter" "user_sg" {
    name  = "/${var.project_name}/${var.Environment}/user_sg"
    type  = "String"
    value = module.user_sg.sg_id  
}
resource "aws_ssm_parameter" "cart_sg" {
    name  = "/${var.project_name}/${var.Environment}/cart_sg"
    type  = "String"
    value = module.cart_sg.sg_id  
}

resource "aws_ssm_parameter" "shipping_sg" {
    name  = "/${var.project_name}/${var.Environment}/shipping_sg"
    type  = "String"
    value = module.shipping_sg.sg_id  
}

resource "aws_ssm_parameter" "app_lb_sg" {
    name  = "/${var.project_name}/${var.Environment}/app_lb_sg"
    type  = "String"
    value = module.app_lb_sg.sg_id  
}

resource "aws_ssm_parameter" "web_sg" {
    name  = "/${var.project_name}/${var.Environment}/web_sg"
    type  = "String"
    value = module.web_sg.sg_id  
}

resource "aws_ssm_parameter" "web_lb_sg" {
    name  = "/${var.project_name}/${var.Environment}/web_lb_sg"
    type  = "String"
    value = module.web_lb_sg.sg_id  
}
