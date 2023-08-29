variable "region" {
  description = "aws region"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "instance type"
  default     = "t2.micro"
}

variable "device_name" {
  description = "device name"
  default     = "/dev/sdd"
}

variable "keypair" {
  description = "keypair from own key"
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDcZCJEPaZbFaxGdsiciGDknctx/lC/WwwWbDl2z1qZF4fhEtHL1BLgRt0rshvRPMv5TMgoOjJaQyMIf9rO8sTdVVOpijEtzKEfD4X4N2fXoVfhlGwRwSzgmdJ/u4KXPHXcMWUG9AOMOS78MPGHolJYULfViq9PwAi+0xzzCkxOfPYK/GKiw5sLwMzvF0S1IJ3ILCCqMP6in+y69vpLGO0f18pRoK00iF2rZRIcmFNViEiH56og7sW37gbZqtU4P12bZrtDwHnaRcZFFJJMYhk+lz9yKALSbaaJK57Y+P16LT2HSAWw9h6Dk1et2EKxSwYlFQxe3/wqmSTcVYutksI7 poman"
}

variable "instance_number" {
  description = "value"
  default     = "2" 
}