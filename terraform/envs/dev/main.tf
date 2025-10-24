module "dynamodb" {
    source = "../../modules/dynamodb"
}

module "iam" {
  source = "../../modules/iam"
  tasks_table_arn = module.dynamodb.tasks_table_arn
  endpoints_table_arn = module.dynamodb.endpoints_table_arn
}


module "vpc" {
  source = "../../modules/vpc"

}

module "ecs" {
  source = "../../modules/ecs"
  CLICKUP_API_TOKEN = var.CLICKUP_API_TOKEN
  CLICKUP_SPACE_ID = var.CLICKUP_SPACE_ID
  CLICKUP_TEAM_ID = var.CLICKUP_TEAM_ID
  ENDPOINTS_TABLE_NAME = module.dynamodb.endpoints_table_name
  TASKS_TABLE_NAME = module.dynamodb.tasks_table_name
  subnet_id = module.vpc.subnet_id
  security_group_id = module.vpc.ecs_sg_id
  AWS_ACCESS_KEY = module.iam.n8n_access_key
  AWS_SECRET_KEY = module.iam.n8n_secret_key
  REGION = var.region
  ecs_task_execution_role_arn = module.iam.ecs_task_execution_role_arn
}


terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.region
}

