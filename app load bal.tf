# Create Application Load Balancer

resource "aws_lb" "project-9-lb" {
  name               ="project-9-load-balancer"
  internal           = false
  load_balancer_type = "application"

  subnets   = [
    aws_subnet.project-9-pub-subnet-1.id , 
    aws_subnet.project-9-pub-subnet-2.id]
  
security_groups = [aws_security_group.pub-sg.id]

  enable_deletion_protection = false

  tags = {
    Name = "project-9-lb"
  }
}
# Create Target Group
# Terraform aws create target group

resource "aws_lb_target_group" "project-9-tg" {
  name     = "project-9-tg"
  target_type = "ip"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.project-9-vpc.id
}

# Create a listener on port 80

   resource "aws_lb_listener" "project_9_listener_group" {
  load_balancer_arn = aws_lb.project-9-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
target_group_arn = aws_lb_target_group.project-9-tg.arn
  }
}