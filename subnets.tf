# create the public Subnet
resource "aws_subnet" "terra_pub" {
  vpc_id                  = "${aws_vpc.terra_VPC.id}"
  cidr_block              = "${var.publicsubCIDR}"
  map_public_ip_on_launch = "${var.mapPublicIP}"
  availability_zone       = "${var.availabilityZone}"

  tags = {
    Name = "terra public Subnet"
  }
} # end resource

# create the private Subnet
resource "aws_subnet" "terra_priv" {
  vpc_id            = "${aws_vpc.terra_VPC.id}"
  cidr_block        = "${var.privatesubCIDR}"
  availability_zone = "${var.availabilityZone}"

  tags = {
    Name = "terra private Subnet"
  }
}

# end resource

