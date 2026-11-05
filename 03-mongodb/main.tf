# module "mongodb-sg" {
#   source = "../../terrform-aws-security-group"
#   sg_name = var.sg_name
#   sg_description = var.sg_description
#   vpc_id = data.aws_ssm_parameter.vpc_id.value
#   common_tags = var.common_tags
#   project_name = var.project_name
#   sg_tags = var.sg_tags
# }

# resource "aws_security_group_rule" "mongodb_sg" {
#   type              = "ingress"
#   from_port         = 22
#   to_port           = 22
#   protocol          = "tcp"
#   #cidr_blocks       = ["${chomp(data.http.my_public_ip.response_body)}/32"]
#   #we use source security group instead of CIDR blocks
#   source_security_group_id = data.aws_ssm_parameter.vpn_sg_id.value
#   #ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
#   security_group_id = module.mongodb-sg.sg_id
# }

module "mongodb_instance" {
    source  = "terraform-aws-modules/ec2-instance/aws"
    ami = data.aws_ami.vpn.id
    key_name = "DevOps_AWS"
    instance_type = "t3.small"
    subnet_id = local.db_subnet_id
    vpc_security_group_ids = [data.aws_ssm_parameter.mongodb_sg.value]
    user_data = file("mongodb.sh")
    tags = merge(
    {
        Name = "Mongodb"
    },var.common_tags
  )
  
}


resource "aws_route53_record" "mongodb" {
  zone_id = var.zone_id
  name    = "mongodb.roboshopservice.store"
  type    = "A"
  ttl     = 300
  records = [module.mongodb_instance.private_ip]
}