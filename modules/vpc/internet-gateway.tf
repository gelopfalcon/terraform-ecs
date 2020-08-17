resource "aws_internet_gateway" "rda_maxar_ig" {
  vpc_id = "${aws_vpc.rda_maxar_vpc.id}"

 tags = {
    Name = "rda_maxar_ig"
  }
}

resource "aws_eip" "rda_maxar_eip_nat" {
  vpc      = true
}

resource "aws_nat_gateway" "rda_maxar_nat_gw" {
  allocation_id = "${aws_eip.rda_maxar_eip_nat.id}"
  subnet_id = "${aws_subnet.rda_maxar_subnet_public_1.id}"
  depends_on = ["aws_internet_gateway.rda_maxar_ig"]
}

