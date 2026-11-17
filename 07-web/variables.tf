variable "project_name" {
    default = "Roboshop"
}
variable "Environment" {
    default = "DEV"
}
variable "common_tags"{ 
    default = {
        terraform = true
        Component = "web"
    }
}
variable "target_group_port" {
  default = 80
}

variable "target_group_protocol" {
  default = "HTTP"
}

variable "health_check" {
  default = {
    enabled = true
    path = "/"
    interval = 30
    healthy_threshold = 2
    unhealthy_threshold = 2
    port = 80
    protocol = "HTTP"
    matcher = "200-299"
    timeout = 5
  }
}


variable "key_name" { 
   default = "DevOps_AWS"
}


variable "launch_template_tags" {
  default = [
    {
      resource_type = "instance"

      tags = {
        Name = "web"
      }
    },

    {
      resource_type = "volume"

      tags = {
        Name = "web"
      }
    }
  ]
}

variable "autoscaling_tags" {
  default = [
    {
      key                 = "Name"
      value               = "Web"
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
  default = 10
}

variable "host_header" {
  default = "roboshopservice.store"
}