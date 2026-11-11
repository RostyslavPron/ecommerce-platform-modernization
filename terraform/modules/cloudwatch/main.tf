resource "aws_cloudwatch_dashboard" "main" {

  dashboard_name =
    "${var.project_name}-dashboard"

  dashboard_body = jsonencode({

    widgets = [

      {
        type = "metric"
        width = 12
        height = 6

        properties = {
          title = "ECS CPU Utilization"

          metrics = [
            [
              "AWS/ECS",
              "CPUUtilization",
              "ClusterName",
              var.ecs_cluster_name,
              "ServiceName",
              var.ecs_service_name
            ]
          ]

          period = 300
          stat   = "Average"
          region = var.aws_region
        }
      },

      {
        type = "metric"
        width = 12
        height = 6

        properties = {
          title = "ALB Request Count"

          metrics = [
            [
              "AWS/ApplicationELB",
              "RequestCount",
              "LoadBalancer",
              var.alb_arn_suffix
            ]
          ]

          stat   = "Sum"
          period = 300
          region = var.aws_region
        }
      },

      {
        type = "metric"
        width = 12
        height = 6

        properties = {
          title = "RDS CPU Utilization"

          metrics = [
            [
              "AWS/RDS",
              "CPUUtilization",
              "DBInstanceIdentifier",
              var.rds_identifier
            ]
          ]

          stat   = "Average"
          period = 300
          region = var.aws_region
        }
      }
    ]
  })
}