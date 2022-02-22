resource "aws_network_interface" "bastion" {
    subnet_id       = aws_subnet.bastion.id
    security_groups = [aws_security_group.bastion_security_group.id]
}

resource "aws_network_interface" "private" {
    subnet_id       = aws_subnet.private.id
    security_groups = [aws_security_group.private_security_group.id]
}