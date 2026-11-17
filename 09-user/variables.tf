variable "project_name" {
    default = "Roboshop"
}
variable "Environment" {
    default = "DEV"
}
variable "common_tags"{ 
    default = {
        terraform = true
        Component = "user"
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
        Name = "user"
      }
    },

    {
      resource_type = "volume"

      tags = {
        Name = "user"
      }
    }
  ]
}

variable "autoscaling_tags" {
  default = [
    {
      key                 = "Name"
      value               = "User"
      propagate_at_launch = true
    } ,
    {
      key                 = "Project"
      value               = "Roboshop"
      propagate_at_launch = true

    }
  ]
}

variable "aws_lb_listener_priority" {
  default = 20
}

variable "host_header" {
  default = "user.app.roboshopservice.store"
}