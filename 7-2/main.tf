provider "aws" {
  region = var.region
}

resource "aws_key_pair" "poman_key" {
  key_name   = "poman-key"
  public_key = var.keypair
}

resource "aws_instance" "HW_backend_instance" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = "poman-key"
  vpc_security_group_ids = data.aws_security_groups.security_groups.ids
  count                  = var.instance_number
  availability_zone      = data.aws_availability_zones.available_zones.names[count.index]

  depends_on = [ aws_instance.HW_database_instance ]
  tags = {
    Name       = "HW_backend"
    Purpose    = "M7-1 practice"
  }
}

resource "aws_instance" "HW_frontend_instance" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = "poman-key"
  vpc_security_group_ids = data.aws_security_groups.security_groups.ids

  depends_on = [ aws_instance.HW_backend_instance ]
  tags = {
    Name       = "HW_frontend"
    Purpose    = "M7-1 practice"
  }
}

resource "aws_instance" "HW_database_instance" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = "poman-key"
  vpc_security_group_ids = data.aws_security_groups.security_groups.ids

  tags = {
    Name       = "HW_database"
    Purpose    = "M7-1 practice"
  }
}

resource "aws_ebs_volume" "HW_second_volume" {
  availability_zone = aws_instance.HW_database_instance.availability_zone
  size              = 10
}

resource "aws_volume_attachment" "vol_att_second" {
  volume_id   = aws_ebs_volume.HW_second_volume.id
  instance_id = aws_instance.HW_database_instance.id
  device_name = var.device_name
}

resource "aws_eip" "frontend_eip" {
  instance = aws_instance.HW_frontend_instance.id
}

resource "aws_eip" "backend_eip" {
  count    = var.instance_number
  instance = aws_instance.HW_backend_instance.*.id[count.index]
}

