variable "region" {
  type = string
  default = "us-east-1"
}


variable "CLICKUP_API_TOKEN" {
  type = string
  sensitive = true
}

variable "CLICKUP_TEAM_ID" {
   type = string
}

variable "CLICKUP_SPACE_ID" {
  type = string
}


