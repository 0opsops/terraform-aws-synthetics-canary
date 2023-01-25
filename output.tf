output "canary_arn" {
  description = "Amazon Resource Name (ARN) of the Canary"
  value       = aws_synthetics_canary.synthetic_canary.arn
}

output "engine_arn" {
  value       = aws_synthetics_canary.synthetic_canary.engine_arn
  description = "ARN of the Lambda function that is used as your canary's engine"
}

output "canary_id" {
  value       = aws_synthetics_canary.synthetic_canary.id
  description = "Name for this canary"
}

output "canary_status" {
  value       = aws_synthetics_canary.synthetic_canary.status
  description = "Canary status"
}

output "vpc_id" {
  description = "ID of the VPC where this canary is to run."
  value       = aws_synthetics_canary.synthetic_canary.vpc_config
}

output "role_arn" {
  value       = aws_iam_role.canary_role.arn
  description = "Amazon Resource Name (ARN) specifying the role"
}

output "role_name" {
  value       = aws_iam_role.canary_role.name
  description = "Name of the role"
}

output "s3_bucket_arn" {
  value       = aws_s3_bucket.bucket.arn
  description = "ARN of s3 bucket"
}

output "s3_bucket_name" {
  value       = aws_s3_bucket.bucket.id
  description = "Name of s3 bucket"
}