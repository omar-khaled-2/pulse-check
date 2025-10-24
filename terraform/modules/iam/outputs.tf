output "n8n_access_key" {
  value = aws_iam_access_key.n8n_access_key.id
}

output "n8n_secret_key" {
    value = aws_iam_access_key.n8n_access_key.secret
}

output "ecs_task_execution_role_arn" {
  value = aws_iam_role.ecs_task_execution_role.arn
}