resource "aws_synthetics_canary" "synthetic_canary" {
  name                 = var.canary_name
  artifact_s3_location = "s3://${aws_s3_bucket.bucket.id}/"
  execution_role_arn   = aws_iam_role.canary_role.arn
  runtime_version      = var.runtime_version
  handler              = var.handler
  zip_file             = var.zip_file_path
  start_canary         = true

  success_retention_period = var.success_retention_period
  failure_retention_period = var.failure_retention_period

  schedule {
    expression          = var.schedule_expression
    duration_in_seconds = var.duration_in_seconds
  }

  run_config {
    timeout_in_seconds    = var.timeout_in_seconds
    memory_in_mb          = var.memory_in_mb
    active_tracing        = var.active_tracing
    environment_variables = var.environment_variables
  }

  vpc_config {
    subnet_ids         = var.subnet_ids
    security_group_ids = var.security_group_ids
  }
}

