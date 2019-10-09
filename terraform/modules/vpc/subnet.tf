resource "aws_subnet" "rda_maxar_subnet_public_1" {
  vpc_id = "${aws_vpc.rda_maxar_vpc.id}"
  cidr_block = var.cidr_block_subnet_1
  availability_zone = var.availability_zone
  map_public_ip_on_launch = "true"

 tags = {
    Name = "rda_maxar_subnet_public_1"
  }
}

resource "aws_subnet" "rda_maxar_subnet_public_2" {
  vpc_id = "${aws_vpc.rda_maxar_vpc.id}"
  cidr_block = var.cidr_block_subnet_2
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = "true"

 tags = {
    Name = "rda_maxar_subnet_public_2"
  }
}

resource "aws_subnet" "rda_maxar_subnet_private_1" {
    vpc_id = "${aws_vpc.rda_maxar_vpc.id}"
    cidr_block = "10.0.4.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = var.availability_zone

    tags = {
        Name = "rda_maxar_subnet_private_1"
    }
}

resource "aws_subnet" "rda_maxar_subnet_private_2" {
    vpc_id = "${aws_vpc.rda_maxar_vpc.id}"
    cidr_block = "10.0.5.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-1b"

    tags = {
        Name = "rda_maxar_subnet_private_2"
    }
}


output "subnet_id_1" {
  value = "${aws_subnet.rda_maxar_subnet_public_1.id}"
}

output "subnet_id_2" {
  value = "${aws_subnet.rda_maxar_subnet_public_2.id}"
}

output "private_subnet_id_1" {
  value = "${aws_subnet.rda_maxar_subnet_private_1.id}"
}

output "private_subnet_id_2" {
  value = "${aws_subnet.rda_maxar_subnet_private_2.id}"
}