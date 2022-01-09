# Create security group

resource "aws_security_group" "pub-sg" {
name = "pub-sg"
vpc_id = aws_vpc.project-9-vpc.id

ingress {

from_port = 22
to_port = 22
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]

}

ingress {

from_port = 80
to_port = 80
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]



}
}