output "endpoints_table_arn" {
    value = aws_dynamodb_table.endpoints_table.arn
}

output "tasks_table_arn" {
  value = aws_dynamodb_table.tasks_table.arn
}

output "endpoints_table_name" {
  value = var.endpoints_table_name
}

output "tasks_table_name" {
  value = var.tasks_table_name
}