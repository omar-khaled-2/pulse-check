resource "aws_ecs_cluster" "main" {
  name = "cluster"
}

resource "aws_ecs_task_definition" "app" {
  family                   = "task"
  requires_compatibilities  = ["FARGATE"]
  network_mode              = "awsvpc"
  cpu                       = "256"
  memory                    = "512"
  execution_role_arn        = var.ecs_task_execution_role_arn

  container_definitions = jsonencode([
    {
      name      = "app"
      image     = "docker.io/${var.docker_image}"
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ],
      environment = [
        { name = "ENDPOINTS_TABLE_NAME", value = var.ENDPOINTS_TABLE_NAME },
        { name = "TASKS_TABLE_NAME",     value = var.TASKS_TABLE_NAME },
        { name = "CLICKUP_TEAM_ID",      value = var.CLICKUP_TEAM_ID },
        { name = "CLICKUP_SPACE_ID",     value = var.CLICKUP_SPACE_ID },
        { name = "REGION",               value = var.REGION },
        { name = "AWS_ACCESS_KEY",       value = var.AWS_ACCESS_KEY }
      ],
      secrets = [
        {
          name      = "AWS_SECRET_KEY"
          valueFrom = var.AWS_SECRET_KEY
        },
        {
          name      = "CLICKUP_API_TOKEN"
          valueFrom = var.CLICKUP_API_TOKEN
        }
      ]
    }
  ])
}


resource "aws_ecs_service" "app_service" {
  name            = "service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = [var.subnet_id]
    security_groups  = [var.security_group_id]
    assign_public_ip = true
  }

}