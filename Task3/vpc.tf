resource "aws_vpc" "vpc" {
    cidr_block           = var.vpc_cidr
    enable_dns_hostnames = true
    tags = {
        Name             = "Terraform VPC"
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id   = aws_vpc.vpc.id
    tags = {
        Name = "Terrafowm IGw"
    }
}

resource "aws_route_table" "bastion_route" {
    vpc_id         = aws_vpc.vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
        Name       = "${var.bastion_name} route table"
    }
}

resource "aws_subnet" "bastion" {
    vpc_id                  = aws_vpc.vpc.id
    cidr_block              = var.bastion_subnet_cidr
    availability_zone       = "eu-central-1a"
    map_public_ip_on_launch = true
    tags = {
        Name                = "${var.bastion_name} subnet"
    }
}

resource "aws_route_table_association" "bastion_route_table_association" {
    subnet_id      = aws_subnet.bastion.id
    route_table_id = aws_route_table.bastion_route.id
}

resource "aws_subnet" "private" {
    vpc_id                  = aws_vpc.vpc.id
    cidr_block              = var.private_subnet_cidr
    availability_zone       = "eu-central-1a"
    map_public_ip_on_launch = false
    tags = {
        Name                = "${var.private_name} subnet"
    }
}