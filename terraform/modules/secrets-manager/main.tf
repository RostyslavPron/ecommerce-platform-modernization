resource "random_password" "db" {
  length           = 24
  special          = true
  override_special = "!@#$%^&*"
}

resource "aws_secretsmanager_secret" "database" {
  name = "${var.project_name}-database-secret"

  tags = {
    Name = "${var.project_name}-database-secret"
  }
}

resource "aws_secretsmanager_secret_version" "database" {

  secret_id = aws_secretsmanager_secret.database.id

  secret_string = jsonencode({
    username = "admin"
    password = random_password.db.result
  })
}