variable "bastion_name" {
    type    = string
    default = "ubuntu-focal-20.04"
}

variable "private_name" {
    type    = string
    default = "amzn2-ami-kernel-5.10"
}

variable "keypair_name" {
    type    = string
    default = "BudValZer-Frankfurt"
}

variable "instance_type" {
    type    = string
    default = "t2.micro"  
}

variable "vpc_cidr" {
    type    = string
    default = "172.16.0.0/21"
}

variable "bastion_subnet_cidr" {
    type    = string
    default = "172.16.0.0/23"
}

variable "private_subnet_cidr" {
    type    = string
    default = "172.16.4.0/23"
}