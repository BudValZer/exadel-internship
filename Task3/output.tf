output "bastion_instance_id" {
    description = "ID of the EC2 instance"
    value       = aws_instance.bastion.id
}

output "bastion_instance_public_ip" {
    description = "Public IP address of the EC2 instance"
    value       = aws_instance.bastion.public_ip
}

output "bastion_instance_private_ip" {
    description = "Private IP address of the EC2 instance"
    value       = aws_instance.bastion.private_ip
}

output "private_instance_id" {
    description = "ID of the EC2 instance"
    value       = aws_instance.private.id
}

output "private_instance_public_ip" {
    description = "Public IP address of the EC2 instance"
    value       = aws_instance.private.public_ip
}

output "private_instance_private_ip" {
    description = "Private IP address of the EC2 instance"
    value       = aws_instance.private.private_ip
}