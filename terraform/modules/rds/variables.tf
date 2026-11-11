variable "project_name" {
  type = string
}

variable "private_db_subnets" {
  type = list(string)
}

variable "rds_security_group_id" {
  type = string
}

variable "database_secret_arn" {
  type = string
}