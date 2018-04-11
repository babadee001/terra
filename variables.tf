# variables
variable "region" {
  default = "eu-west-2"
}

variable "aws_secret_key" {
  default = ""
}

variable "aws_access_key" {
  default = ""
}

variable "availabilityZone" {
  default = "eu-west-2a"
}

variable "instanceTenancy" {
  default = "default"
}

variable "dnsSupport" {
  default = true
}

variable "dnsHostNames" {
  default = true
}

variable "vpcCIDRblock" {
  default = "42.1.0.0/16"
}

variable "subnetCIDRblock" {
  default = "42.1.0.0/24"
}

variable "destinationCIDRblock" {
  default = "0.0.0.0/0"
}

variable "ingressCIDRblock" {
  type    = "list"
  default = ["0.0.0.0/0"]
}

variable "mapPublicIP" {
  default = true
}

variable "publicsubCIDR" {
  default = "42.1.1.0/24"
}

variable "privatesubCIDR" {
  default = "42.1.2.0/24"
}

# end of variables.tf

