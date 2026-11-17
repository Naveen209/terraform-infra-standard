variable "project_name" {
    default = "Roboshop"
}
variable "Environment" {
    default = "DEV"
}
variable "common_tags"{ 
    default = {
        terraform = true
        Component = "cart"
    }
}
variable "target_group_port" {
  default = 8080
}

variable "target_group_protocol" {
  default = "HTTP"
}


variable "key_name" { 
   default = "DevOps_AWS"
}


variable "launch_template_tags" {
  default = [
    {
      resource_type = "instance"

      tags = {
        Name = "cart"
      }
    },

    {
      resource_type = "volume"

      tags = {
        Name = "cart"
      }
    }
  ]
}

variable "autoscaling_tags" {
  default = [
    {
      key                 = "Name"
      value               = "Cart"
      propagate_at_launch = true
    } ,
    {
      key                 = "Project"
      value               = "Cart"
      propagate_at_launch = true

    }
  ]
}

variable "aws_lb_listener_priority" {
  default = 30
}

variable "host_header" {
  default = "cart.app.roboshopservice.store"
}