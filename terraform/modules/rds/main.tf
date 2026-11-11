resource "aws_db_subnet_group" "main" {
  name = "${var.project_name}-db-subnet-group"

  subnet_ids = var.private_db_subnets

  tags = {
    Name = "${var.project_name}-db-subnet-group"
  }
}

resource "aws_db_instance" "main" {

  identifier = "${var.project_name}-mysql"

  engine         = "mysql"
  engine_version = "8.0"

  instance_class = "db.t3.micro"

  allocated_storage = 20
  storage_type      = "gp3"

  db_name  = "ecommerce"
  username = local.db_credentials.username
  password = local.db_credentials.password

  multi_az = true

  publicly_accessible = false

  storage_encrypted = true

  backup_retention_period = 7

  deletion_protection = false

  vpc_security_group_ids = [
    var.rds_security_group_id
  ]

  db_subnet_group_name =
    aws_db_subnet_group.main.name

  skip_final_snapshot = true

  tags = {
    Name = "${var.project_name}-mysql"
  }
}

data "aws_secretsmanager_secret_version" "database" {
  secret_id = var.database_secret_arn
}

locals {
  db_credentials =
    jsondecode(data.aws_secretsmanager_secret_version.database.secret_string)
}