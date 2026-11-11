output "cluster_name" {
  value = aws_ecs_cluster.main.name
}

output "cluster_arn" {
  value = aws_ecs_cluster.main.arn
}

output "service_name" {
  value = aws_ecs_service.app.name
}

output "autoscaling_min_capacity" {
  value = 2
}

output "autoscaling_max_capacity" {
  value = 10
}