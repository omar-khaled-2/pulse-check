resource "aws_dynamodb_table" "endpoints_table" {
  name             = var.endpoints_table_name

  billing_mode     = "PAY_PER_REQUEST"
  hash_key = "id"
  attribute {
    name = "id"
    type = "S"
  }

}

resource "aws_dynamodb_table" "tasks_table" {
  name             = var.tasks_table_name

  billing_mode     = "PAY_PER_REQUEST"
  hash_key = "endpoint_id"
  attribute {
    name = "endpoint_id"
    type = "S"
  }

}
