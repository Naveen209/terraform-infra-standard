module "mysql_instance" {
    source  = "terraform-aws-modules/ec2-instance/aws"
    ami = data.aws_ami.ami.id
    key_name = "DevOps_AWS"
    instance_type = "t3.small"
    subnet_id = local.db_subnet_id
    vpc_security_group_ids = [data.aws_ssm_parameter.mysql_sg.value]
    user_data = file("mysql.sh")
    tags = merge(
    {
        Name = "Mysql"
    },var.common_tags
  )
  
}


resource "aws_route53_record" "mysql" {
  zone_id = var.zone_id
  name    = "mysql"
  type    = "A"
  ttl     = 300
  records = [module.mysql_instance.private_ip]
}