# treate VPC/Subnet/Security Group
provider "aws" {
  region     = "${var.region}"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
} # end provider

# create the VPC
resource "aws_vpc" "terra_VPC" {
  cidr_block           = "${var.vpcCIDRblock}"
  instance_tenancy     = "${var.instanceTenancy}"
  enable_dns_support   = "${var.dnsSupport}"
  enable_dns_hostnames = "${var.dnsHostNames}"

  tags {
    Name = "terra_VPC"
  }
} # end resource

# Create the Internet Access
# resource "aws_route" "terra_VPC_internet_access" {
#   route_table_id         = "${aws_route_table.terra_VPC_route_table.id}"
#   destination_cidr_block = "${var.destinationCIDRblock}"
#   gateway_id             = "${aws_internet_gateway.terra-igw}"
# } # end resource


# end vpc.tf

