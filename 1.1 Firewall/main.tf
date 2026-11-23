module "vpn_sg" {
  source = "../../terrform-aws-security-group"
  project_name = var.project_name
  sg_name = "roboshop-vpn"
  sg_description = "Allowing all ports from my home IP"
  #sg_ingress_rules = var.sg_ingress_rules
  vpc_id = data.aws_vpc.default.id
  common_tags  = merge(
    var.common_tags,
    {
        Component = "VPN",
        Name = "roboshop-VPN"
    }
  )
}

module "mongodb_sg" {
  source = "../../terrform-aws-security-group"
  project_name = var.project_name
  sg_name = "mongodb_sg"
  sg_description = "Allowing traffic"
  #sg_ingress_rules = var.sg_ingress_rules
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags  = merge(
    var.common_tags,
    {
        Component = "Mongodb",
        Name = "Mongodb_sg"
    }
  )
}

module "redis_sg" {
  source = "../../terrform-aws-security-group"
  project_name = var.project_name
  sg_name = "redis_sg"
  sg_description = "Allowing traffic"
  #sg_ingress_rules = var.sg_ingress_rules
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags  = merge(
    var.common_tags,
    {
        Component = "Redis",
        Name = "Redis_sg"
    }
  )
}


module "mysql_sg" {
  source = "../../terrform-aws-security-group"
  project_name = var.project_name
  sg_name = "mysql_sg"
  sg_description = "Allowing traffic"
  #sg_ingress_rules = var.sg_ingress_rules
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags  = merge(
    var.common_tags,
    {
        Component = "MySQL",
        Name = "MySQL_sg"
    }
  )
}

module "rabbitmq_sg" {
  source = "../../terrform-aws-security-group"
  project_name = var.project_name
  sg_name = "rabbitmq_sg"
  sg_description = "Allowing traffic"
  #sg_ingress_rules = var.sg_ingress_rules
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags  = merge(
    var.common_tags,
    {
        Component = "RabbitMQ",
        Name = "RabbitMQ_sg"
    }
  )
}

module "catalogue_sg" {
  source = "../../terrform-aws-security-group"
  project_name = var.project_name
  sg_name = "catalogue_sg"
  sg_description = "Allowing traffic"
  #sg_ingress_rules = var.sg_ingress_rules
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags  = merge(
    var.common_tags,
    {
        Component = "Catalogue",
        Name = "Catalogue_sg"
    }
  )
}

module "user_sg" {
  source = "../../terrform-aws-security-group"
  project_name = var.project_name
  sg_name = "user_sg"
  sg_description = "Allowing traffic"
  #sg_ingress_rules = var.sg_ingress_rules
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags  = merge(
    var.common_tags,
    {
        Component = "User",
        Name = "User_sg"
    }
  )
}

module "cart_sg" {
  source = "../../terrform-aws-security-group"
  project_name = var.project_name
  sg_name = "cart_sg"
  sg_description = "Allowing traffic"
  #sg_ingress_rules = var.sg_ingress_rules
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags  = merge(
    var.common_tags,
    {
        Component = "Cart",
        Name = "Cart_sg"
    }
  )
}

module "shipping_sg" {
  source = "../../terrform-aws-security-group"
  project_name = var.project_name
  sg_name = "shipping_sg"
  sg_description = "Allowing traffic"
  #sg_ingress_rules = var.sg_ingress_rules
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags  = merge(
    var.common_tags,
    {
        Component = "Shipping",
        Name = "Shipping_sg"
    }
  )
}

module "payment_sg" {
  source = "../../terrform-aws-security-group"
  project_name = var.project_name
  sg_name = "payment_sg"
  sg_description = "Allowing traffic"
  #sg_ingress_rules = var.sg_ingress_rules
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags  = merge(
    var.common_tags,
    {
        Component = "Payment",
        Name = "Payment_sg"
    }
  )
}
module "app_lb_sg" {
  source = "../../terrform-aws-security-group"
  project_name = var.project_name
  sg_name = "app_lb_sg"
  sg_description = "Allowing traffic"
  #sg_ingress_rules = var.sg_ingress_rules
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags  = merge(
    var.common_tags,
    {
        Component = "App_lb",
        Name = "App_lb_sg"
    }
  )
}

module "web_sg" {
  source = "../../terrform-aws-security-group"
  project_name = var.project_name
  sg_name = "web_sg"
  sg_description = "Allowing traffic"
  #sg_ingress_rules = var.sg_ingress_rules
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags  = merge(
    var.common_tags,
    {
        Component = "Web",
        Name = "Web_sg"
    }
  )
}

module "web_lb_sg" {
  source = "../../terrform-aws-security-group"
  project_name = var.project_name
  sg_name = "web_lb_sg"
  sg_description = "Allowing traffic"
  #sg_ingress_rules = var.sg_ingress_rules
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags  = merge(
    var.common_tags,
    {
        Component = "Web-lb",
        Name = "Web_lb_sg"
    }
  )
}

resource "aws_security_group_rule" "vpn" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["${chomp(data.http.my_public_ip.response_body)}/32"]
  #source_security_group_id = data.aws_ssm_parameter.vpn_sg_id.value
  security_group_id = module.vpn_sg.sg_id
}

resource "aws_security_group_rule" "mongodb_catalogue" {
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  #cidr_blocks       = ["${chomp(data.http.my_public_ip.response_body)}/32"]
  #we use source security group instead of CIDR blocks
  source_security_group_id = module.catalogue_sg.sg_id
  security_group_id = module.mongodb_sg.sg_id
}



resource "aws_security_group_rule" "mongodb_user" {
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  #cidr_blocks       = ["${chomp(data.http.my_public_ip.response_body)}/32"]
  #we use source security group instead of CIDR blocks
  source_security_group_id = module.user_sg.sg_id
  security_group_id = module.mongodb_sg.sg_id
}

resource "aws_security_group_rule" "mongodb_vpn"{
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  #cidr_blocks       = ["${chomp(data.http.my_public_ip.response_body)}/32"]
  #we use source security group instead of CIDR blocks
  source_security_group_id = module.vpn_sg.sg_id
  security_group_id = module.mongodb_sg.sg_id
}

resource "aws_security_group_rule" "redis_vpn"{
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  #cidr_blocks       = ["${chomp(data.http.my_public_ip.response_body)}/32"]
  #we use source security group instead of CIDR blocks
  source_security_group_id = module.vpn_sg.sg_id
  security_group_id = module.redis_sg.sg_id
}

resource "aws_security_group_rule" "redis_user"{
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  #cidr_blocks       = ["${chomp(data.http.my_public_ip.response_body)}/32"]
  #we use source security group instead of CIDR blocks
  source_security_group_id = module.user_sg.sg_id
  security_group_id = module.redis_sg.sg_id
}

resource "aws_security_group_rule" "redis_cart"{
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  #cidr_blocks       = ["${chomp(data.http.my_public_ip.response_body)}/32"]
  #we use source security group instead of CIDR blocks
  source_security_group_id = module.cart_sg.sg_id
  security_group_id = module.redis_sg.sg_id
}

resource "aws_security_group_rule" "mysql_shipping"{

  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  #cidr_blocks       = ["${chomp(data.http.my_public_ip.response_body)}/32"]
  #we use source security group instead of CIDR blocks
  source_security_group_id = module.shipping_sg.sg_id
  security_group_id = module.mysql_sg.sg_id
}

resource "aws_security_group_rule" "mysql_vpn"{
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  #cidr_blocks       = ["${chomp(data.http.my_public_ip.response_body)}/32"]
  #we use source security group instead of CIDR blocks
  source_security_group_id = module.vpn_sg.sg_id
  security_group_id = module.mysql_sg.sg_id
}

resource "aws_security_group_rule" "rabbitmq_vpn"{
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  #cidr_blocks       = ["${chomp(data.http.my_public_ip.response_body)}/32"]
  #we use source security group instead of CIDR blocks
  source_security_group_id = module.vpn_sg.sg_id
  security_group_id = module.rabbitmq_sg.sg_id
}

resource "aws_security_group_rule" "rabbitmq_payment"{
  type              = "ingress"
  from_port         = 5672
  to_port           = 5672
  protocol          = "tcp"
  #cidr_blocks       = ["${chomp(data.http.my_public_ip.response_body)}/32"]
  #we use source security group instead of CIDR blocks
  source_security_group_id = module.payment_sg.sg_id
  security_group_id = module.rabbitmq_sg.sg_id
}

resource "aws_security_group_rule" "catalogue_app_lb"{
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  #cidr_blocks       = ["${chomp(data.http.my_public_ip.response_body)}/32"]
  #we use source security group instead of CIDR blocks
  source_security_group_id = module.app_lb_sg.sg_id
  security_group_id = module.catalogue_sg.sg_id
}

resource "aws_security_group_rule" "catalogue_vpn"{
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  #cidr_blocks       = ["${chomp(data.http.my_public_ip.response_body)}/32"]
  #we use source security group instead of CIDR blocks
  source_security_group_id = module.vpn_sg.sg_id
  security_group_id = module.catalogue_sg.sg_id
}

resource "aws_security_group_rule" "user_app_lb"{
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  #cidr_blocks       = ["${chomp(data.http.my_public_ip.response_body)}/32"]
  #we use source security group instead of CIDR blocks
  source_security_group_id = module.app_lb_sg.sg_id
  security_group_id = module.user_sg.sg_id

}


resource "aws_security_group_rule" "user_vpn"{
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  #cidr_blocks       = ["${chomp(data.http.my_public_ip.response_body)}/32"]
  #we use source security group instead of CIDR blocks
  source_security_group_id = module.vpn_sg.sg_id
  security_group_id = module.user_sg.sg_id
}


resource "aws_security_group_rule" "cart_app_lb"{
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  #cidr_blocks       = ["${chomp(data.http.my_public_ip.response_body)}/32"]
  #we use source security group instead of CIDR blocks
  source_security_group_id = module.app_lb_sg.sg_id
  security_group_id = module.cart_sg.sg_id
}

resource "aws_security_group_rule" "cart_vpn"{
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  #cidr_blocks       = ["${chomp(data.http.my_public_ip.response_body)}/32"]
  #we use source security group instead of CIDR blocks
  source_security_group_id = module.vpn_sg.sg_id
  security_group_id = module.cart_sg.sg_id
}

resource "aws_security_group_rule" "shipping_app_lb"{
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  #cidr_blocks       = ["${chomp(data.http.my_public_ip.response_body)}/32"]
  #we use source security group instead of CIDR blocks
  source_security_group_id = module.app_lb_sg.sg_id
  security_group_id = module.shipping_sg.sg_id
}

resource "aws_security_group_rule" "shipping_vpn"{
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  #cidr_blocks       = ["${chomp(data.http.my_public_ip.response_body)}/32"]
  #we use source security group instead of CIDR blocks
  source_security_group_id = module.vpn_sg.sg_id
  security_group_id = module.shipping_sg.sg_id
}

resource "aws_security_group_rule" "payment_app_lb"{
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  #cidr_blocks       = ["${chomp(data.http.my_public_ip.response_body)}/32"]
  #we use source security group instead of CIDR blocks
  source_security_group_id = module.app_lb_sg.sg_id
  security_group_id = module.payment_sg.sg_id
}

resource "aws_security_group_rule" "payment_vpn"{
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  #cidr_blocks       = ["${chomp(data.http.my_public_ip.response_body)}/32"]
  #we use source security group instead of CIDR blocks
  source_security_group_id = module.vpn_sg.sg_id
  security_group_id = module.payment_sg.sg_id
}


resource "aws_security_group_rule" "app_lb_web"{
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  #cidr_blocks       = ["${chomp(data.http.my_public_ip.response_body)}/32"]
  #we use source security group instead of CIDR blocks
  source_security_group_id = module.web_sg.sg_id
  security_group_id = module.app_lb_sg.sg_id
}

resource "aws_security_group_rule" "app_lb_vpn"{
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  #cidr_blocks       = ["${chomp(data.http.my_public_ip.response_body)}/32"]
  #we use source security group instead of CIDR blocks
  source_security_group_id = module.vpn_sg.sg_id
  security_group_id = module.app_lb_sg.sg_id
}

resource "aws_security_group_rule" "app_lb_catalogue"{
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  #cidr_blocks       = ["${chomp(data.http.my_public_ip.response_body)}/32"]
  #we use source security group instead of CIDR blocks
  source_security_group_id = module.catalogue_sg.sg_id
  security_group_id = module.app_lb_sg.sg_id
}

resource "aws_security_group_rule" "app_lb_user"{
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  #cidr_blocks       = ["${chomp(data.http.my_public_ip.response_body)}/32"]
  #we use source security group instead of CIDR blocks
  source_security_group_id = module.user_sg.sg_id
  security_group_id = module.app_lb_sg.sg_id
}

resource "aws_security_group_rule" "app_lb_cart"{
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  #cidr_blocks       = ["${chomp(data.http.my_public_ip.response_body)}/32"]
  #we use source security group instead of CIDR blocks
  source_security_group_id = module.cart_sg.sg_id
  security_group_id = module.app_lb_sg.sg_id
}

resource "aws_security_group_rule" "app_lb_shipping"{
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  #cidr_blocks       = ["${chomp(data.http.my_public_ip.response_body)}/32"]
  #we use source security group instead of CIDR blocks
  source_security_group_id = module.shipping_sg.sg_id
  security_group_id = module.app_lb_sg.sg_id
}

resource "aws_security_group_rule" "app_lb_payment"{
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  #cidr_blocks       = ["${chomp(data.http.my_public_ip.response_body)}/32"]
  #we use source security group instead of CIDR blocks
  source_security_group_id = module.payment_sg.sg_id
  security_group_id = module.app_lb_sg.sg_id
}

resource "aws_security_group_rule" "web_web_lb"{
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  #cidr_blocks       = ["${chomp(data.http.my_public_ip.response_body)}/32"]
  #we use source security group instead of CIDR blocks
  source_security_group_id = module.web_lb_sg.sg_id
  security_group_id =  module.web_sg.sg_id
}

resource "aws_security_group_rule" "web_vpn" {
  type              = "ingress"
  description = "Allowing port number 80 from VPN"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = module.vpn_sg.sg_id
  #cidr_blocks       = ["${chomp(data.http.myip.body)}/32"]
  #ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
  security_group_id = module.web_sg.sg_id
}



resource "aws_security_group_rule" "web_vpn_ssh"{
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  #cidr_blocks       = ["${chomp(data.http.my_public_ip.response_body)}/32"]
  #we use source security group instead of CIDR blocks
  source_security_group_id = module.vpn_sg.sg_id
  security_group_id = module.web_sg.sg_id
}


resource "aws_security_group_rule" "web_lb_internet"{
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  #we use source security group instead of CIDR blocks
  #source_security_group_id = module.vpn_sg.sg_id
  security_group_id = module.web_lb_sg.sg_id
}

resource "aws_security_group_rule" "web_lb_internet_https"{
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  #we use source security group instead of CIDR blocks
  #source_security_group_id = module.vpn_sg.sg_id
  security_group_id = module.web_lb_sg.sg_id
}

