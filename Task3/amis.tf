data "aws_ami" "latest_ubuntu" {
most_recent    = true
owners         = ["099720109477"]
    filter {
        name   = "name"
        values = ["ubuntu/*/${var.bastion_name}-*"]
    }
    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
    filter {
        name   = "architecture"
        values = ["x86_64"]
    }
}

data "aws_ami" "latest_amazon" {
most_recent    = true
owners         = ["137112412989"]
    filter {
        name   = "name"
        values = ["${var.private_name}-*-gp2"]
    }
    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
    filter {
        name   = "architecture"
        values = ["x86_64"]
    }
}
