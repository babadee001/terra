# Create the Internet Gateway
resource "aws_internet_gateway" "terra-igw" {
  vpc_id = "${aws_vpc.terra_VPC.id}"

  tags {
    Name = "My Internet Gateway"
  }
}

# end resource

