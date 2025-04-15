output "load_balancer_url" {
  value = aws_lb.simple_time_service_lb.dns_name
}
