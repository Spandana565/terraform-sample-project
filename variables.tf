variable "amazon_ami" {}

variable "my_access_cidr" {
   type = string
  default = "98.16.180.39/32"
}

variable "key_name" {}
variable "key_file_path" {}

variable "linux_hostname" {}

variable "linux_instance_type" {}

variable "linux_username" {}

variable "ingressrules" {
  type    = list(number)
  default = [8090, 22]
}

variable "region" {}

variable "sgname" {}
variable "subnet_id" {}

variable "vpc_id" {}

