variable "subnet_id" {
  type = string
  
}

variable "security_group_id" {
  type = string
}

variable "ecs_task_execution_role_arn" {
  type = string
}


variable "docker_image" {
    type = string
    default = "value"
}

variable "ENDPOINTS_TABLE_NAME" {
    type = string
}

variable "TASKS_TABLE_NAME" {
  type = string
}


variable "CLICKUP_TEAM_ID" {
   type = string
}

variable "CLICKUP_SPACE_ID" {
  type = string
}

variable "REGION" {
  type = string
}

variable "AWS_ACCESS_KEY" {
  type = string
}

variable "AWS_SECRET_KEY" {
  type = string
  sensitive = true
}

variable "CLICKUP_API_TOKEN" {
  type = string
  sensitive = true
}
