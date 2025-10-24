output "subnet_id" {
  value = aws_subnet.main.id
}

output "ecs_sg_id" {
  value = aws_security_group.ecs_sg.id
}