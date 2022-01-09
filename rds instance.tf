# Create Database Instance

resource "aws_db_instance" "project-9-data-instance" {
  allocated_storage    = 12
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "dmo"
  password             = "passdmoos"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  availability_zone = "eu-west-1a"

 }

# Database Subnet Group

resource "aws_db_subnet_group" "project-9-db-sg" {
  name       = "project-9-db-sg"
  subnet_ids = [aws_subnet.project-9-pri-subnet-1.id,aws_subnet.project-9-pri-subnet-2.id]

  tags = {
    Name = "project-9-db-sg"
  }
}


# Create Database Security Group

resource "aws_security_group" "db-SG" {
  name        = "db-SG"
  description = "Allow http inbound traffic "
  vpc_id      = aws_vpc.project-9-vpc.id

  
ingress {
    description      = "HTTP from VPC"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
     }

  tags = {
    Name = "db-SG"


  }
}
