terraform {
    cloud {
        organization = "budvalzer"
        workspaces {
            name     = "exadel"
        }
    }
    required_providers {
        aws = {
            source   = "hashicorp/aws"
            version  = "~> 3.27"
        }
    }
}

resource "aws_instance" "bastion" {
    ami           = "${data.aws_ami.latest_ubuntu.id}"
    instance_type = var.instance_type
    key_name      = var.keypair_name
    tags = {
        Name      = "${var.bastion_name}"
    }
    user_data     = <<EOF
#!/bin/bash
apt update
apt install nginx -y
echo "<br>hello, world!
OS version is:<br>" > /var/www/html/*.html
lsb_release -a >> /var/www/html/*.html
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update
apt install docker-ce docker-ce-cli containerd.io
EOF
network_interface {
        network_interface_id = aws_network_interface.bastion.id
        device_index         = 0
    }
}

resource "aws_instance" "private" {
    # For extra task №8 I`ve used ami from ubuntu, check README.md for details
    #ami           = "${data.aws_ami.latest_amazon.id}"
    ami           = "${data.aws_ami.latest_ubuntu.id}"
    instance_type = var.instance_type
    key_name      = var.keypair_name
    tags = {
        Name      = "${var.private_name}"
    }
    user_data     = <<EOF
#!/bin/bash
echo 'Acquire {
  HTTP::proxy "http://127.0.0.1:8888";
  HTTPS::proxy "http://127.0.0.1:8888";
}' >> /etc/apt/apt.conf.d/proxy.conf
EOF
    network_interface {
        network_interface_id = aws_network_interface.private.id
        device_index         = 0
    }
}