output "public_ips" {
  value = {
    first_instance_public_ip  = aws_instance.HW_first_instance.public_ip
    second_instance_public_ip = aws_instance.HW_second_instance.public_ip
  }
}

output "private_ips" {
  value = {
    first_instance_private_ip  = aws_instance.HW_first_instance.private_ip
    second_instance_private_ip = aws_instance.HW_second_instance.private_ip
  }
}

output "instance_ids" {
  value = {
    first_instance_public_ip  = aws_instance.HW_first_instance.id
    second_instance_public_ip = aws_instance.HW_second_instance.id
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
