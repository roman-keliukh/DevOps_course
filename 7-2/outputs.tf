output "public_ips" {
  value = {
    frontend_instance_public_ip  = aws_instance.HW_frontend_instance.public_ip
    backend_instance_public_ip = [for i in aws_instance.HW_backend_instance : i.public_ip]
    database_instance_public_ip = aws_instance.HW_database_instance.public_ip
  }
}

output "private_ips" {
  value = {
    frontend_instance_private_ip  = aws_instance.HW_frontend_instance.private_ip
    backend_instance_private_ip = [for i in aws_instance.HW_backend_instance : i.private_ip]
    database_instance_private_ip = aws_instance.HW_database_instance.private_ip
  }
}

output "instance_ids" {
  value = {
    frontend_instance_id  = aws_instance.HW_frontend_instance.id
    backend_instance_id = [for i in aws_instance.HW_backend_instance : i.id]
    database_instance_id = aws_instance.HW_database_instance.id
  }
}

output "aws_region" {
  value = data.aws_region.current.name
}

output "aws_availability_zones" {
  value = data.aws_availability_zones.available_zones.names
}

output "aws_vpcs" {
  value = data.aws_vpcs.all_vpcs.ids
}

output "aws_security_groups" {
  value = data.aws_security_groups.security_groups
}