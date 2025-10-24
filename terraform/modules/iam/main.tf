resource "aws_iam_user" "n8n_iam_user" {
  name = "n8n"

  force_destroy = true
  
}



resource "aws_iam_access_key" "n8n_access_key" {
  user    = aws_iam_user.n8n_iam_user.name
}


resource "aws_iam_policy" "dynamodb_full_access" {
  name        = "dynamodb-full-access"
  description = "Allow all DynamoDB actions"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "dynamodb:*"
        Resource = [
          var.endpoints_table_arn,
          var.tasks_table_arn
        ]
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "attach_dynamodb_policy" {
  user       = aws_iam_user.n8n_iam_user.name
  policy_arn = aws_iam_policy.dynamodb_full_access.arn
}



data "aws_iam_policy_document" "ecs_assume_role_policy" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "ecs_task_execution_role" {
  name               = "ecsTaskExecutionRole"
  assume_role_policy = data.aws_iam_policy_document.ecs_assume_role_policy.json
}


resource "aws_iam_role_policy_attachment" "ecs_task_execution_policy" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}