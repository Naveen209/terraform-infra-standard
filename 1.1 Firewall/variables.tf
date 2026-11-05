variable "sg_name" {
  default = "roboshop-vpn"
}

variable "project_name" {
    default = "Roboshop"
}
variable "Environment" {
    default = "DEV"
}
variable "common_tags"{ 
    default = {
        terraform = true
        Project = "Roboshop"
        Environment= "DEV"
    }
}
