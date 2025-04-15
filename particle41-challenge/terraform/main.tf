provider "aws" {
  region = "us-west-2"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-west-2b"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-west-2a"
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = "us-west-2b"
}

resource "aws_security_group" "simple_time_service_sg" {
  name        = "simple-time-service-sg"
  description = "Allow HTTP traffic for ECS service"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_ecs_cluster" "simple_time_service_cluster" {
  name = "simple-time-service-cluster"
}

resource "aws_ecs_task_definition" "simple_time_service_task" {
  family                   = "simple-time-service-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([{
    name      = "simple-time-service-container"
    image     = "ajay829/simple-time-service:latest"
    essential = true
    portMappings = [
      {
        containerPort = 5000
        hostPort      = 5000
      }
    ]
  }])
}

resource "aws_ecs_service" "simple_time_service_service" {
  name            = "simple-time-service"
  cluster         = aws_ecs_cluster.simple_time_service_cluster.id
  task_definition = aws_ecs_task_definition.simple_time_service_task.arn
  desired_count   = 1
  launch_type     = "FARGATE"
  
  network_configuration {
    subnets          = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
    assign_public_ip = false
    security_groups  = [aws_security_group.simple_time_service_sg.id]
  }
}

resource "aws_lb" "simple_time_service_lb" {
  name               = "simple-time-service-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups   = [aws_security_group.simple_time_service_sg.id]
  subnets            = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
}

resource "aws_lb_target_group" "simple_time_service_target_group" {
  name     = "simple-time-service-target-group"
  port     = 5000
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}

resource "aws_lb_listener" "simple_time_service_listener" {
  load_balancer_arn = aws_lb.simple_time_service_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.simple_time_service_target_group.arn
  }
}

resource "aws_lb_listener_rule" "simple_time_service_listener_rule" {
  listener_arn = aws_lb_listener.simple_time_service_listener.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.simple_time_service_target_group.arn
  }

  condition {
    path_pattern {
      values = ["/"]
    }
  }
}
