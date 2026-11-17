

variable "project_name" {
    default = "Roboshop"
}
variable "Environment" {
    default = "DEV"
}
variable "common_tags"{ 
    default = {
        terraform = true
        component = "rabbitmq"
    }
}
variable "sg_tags" {
    default = "rabbitmq_sg"
}

variable "zone_id" {
  default = "Z037034227WXO956D2R9Q"
}
