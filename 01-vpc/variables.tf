variable "cidr_block" {
    default = "10.0.0.0/16"
}

variable "common_tags"{ 
    default = {
        terraform = true
        Project = "Roboshop"
        Environment= "DEV"
        component = "vpc"
    }
}

variable "project_name" {
  type = string
  default = "Roboshop"
}
variable "Environment" {
  type = string
  default = "DEV"
}

variable "public_cidr_blocks" {
  type = list
  default = ["10.0.1.0/24","10.0.2.0/24",]
}

variable "private_cidr_blocks" {
  type = list
  default = ["10.0.11.0/24","10.0.12.0/24",]
}

variable "database_cidr_blocks" {
  type = list
  default = ["10.0.21.0/24","10.0.22.0/24",]
}
