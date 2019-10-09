resource "aws_security_group" "rda_maxar-vpc-security-group" {
    name        = "rda_maxar-vpc-security-group"
    description = "Allow HTTP, HTTPS, and SSH"
    vpc_id = "${aws_vpc.rda_maxar_vpc.id}"

    // HTTP
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    // HTTPS
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    // SSH
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

output "security_group_id" {
  value = "${aws_security_group.rda_maxar-vpc-security-group.id}"
}