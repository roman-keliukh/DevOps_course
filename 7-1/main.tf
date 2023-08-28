provider "aws" {
  region = var.region
}

resource "aws_key_pair" "poman_key" {
  key_name   = "poman-key"
  public_key = var.keypair
}

resource "aws_instance" "HW_first_instance" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = "poman-key"
  vpc_security_group_ids = [aws_security_group.simple_security_group.id]

  tags = {
    Name       = "HW_first"
    Purpose    = "M7-1 practice"
  }
}

resource "aws_instance" "HW_second_instance" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = "poman-key"
  vpc_security_group_ids = [aws_security_group.simple_security_group.id]


  tags = {
    Name       = "HW_second"
    Purpose    = "M7-1 practice"
  }
}

resource "aws_ebs_volume" "HW_first_volume" {
  availability_zone = aws_instance.HW_first_instance.availability_zone
  size              = 10
  count             = 2
}

resource "aws_ebs_volume" "HW_second_volume" {
  availability_zone = aws_instance.HW_second_instance.availability_zone
  size              = 10
  count             = 2  
}

resource "aws_volume_attachment" "vol_att_first" {
  count       = length(aws_ebs_volume.HW_first_volume)
  volume_id   = aws_ebs_volume.HW_first_volume.*.id[count.index]
  instance_id = aws_instance.HW_first_instance.id
  device_name = var.device_name[count.index]
}

resource "aws_volume_attachment" "vol_att_second" {
  count       = length(aws_ebs_volume.HW_second_volume)
  volume_id   = aws_ebs_volume.HW_second_volume.*.id[count.index]
  instance_id = aws_instance.HW_second_instance.id
  device_name = var.device_name[count.index]
}

resource "aws_eip" "first_eip" {
  instance = aws_instance.HW_first_instance.id
}

resource "aws_eip" "second_eip" {
  instance = aws_instance.HW_second_instance.id
}

resource "aws_security_group" "simple_security_group" {
  name        = "simple_security_group"
  description = "HW security group"

  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
