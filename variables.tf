variable "region" {
  description = "AWS region"
  type        = string
}

variable "canary_name" {
  type        = string
  description = "Name for the canary. Has a maximum length of 21 characters. "
}

variable "runtime_version" {
  default     = "syn-python-selenium-1.3"
  type        = string
  description = "Runtime version to use for the canary. Versions change often so consult the Amazon CloudWatch documentation for the latest valid versions."
}

variable "zip_file_path" {
  type        = string
  description = "ZIP file that contains the script."
}

variable "artifact_bucket_name" {
  type        = string
  description = "Location in Amazon S3 where Synthetics stores artifacts from the test runs of this canary."
}

variable "handler" {
  type        = string
  description = "Entry point to use for the source code when running the canary. This value must end with the string `.handler`"
}

variable "schedule_expression" {
  type        = string
  description = "Configuration block providing how often the canary is to run and when these test runs are to stop"
}

variable "duration_in_seconds" {
  type        = number
  description = "Duration in seconds, for the canary to continue making regular runs according to the schedule in the Expression value."
  default     = null
}

variable "success_retention_period" {
  default     = 2
  type        = number
  description = "Number of days to retain data about successful runs of this canary."
}

variable "failure_retention_period" {
  default     = 14
  type        = number
  description = "Number of days to retain data about failed runs of this canary."
}

variable "timeout_in_seconds" {
  default     = null
  type        = string
  description = "Number of seconds the canary is allowed to run before it must stop."
}

variable "memory_in_mb" {
  default     = null
  type        = string
  description = "Maximum amount of memory available to the canary while it is running, in MB."
}

variable "active_tracing" {
  default     = null
  type        = string
  description = "Whether this canary is to use active AWS X-Ray tracing when it runs."
}

variable "environment_variables" {
  default     = null
  type        = map(string)
  description = "Map of environment variables that are accessible from the canary during execution."
}

variable "subnet_ids" {
  default     = null
  type        = list(string)
  description = "IDs of the subnets where this canary is to run"
}

variable "security_group_ids" {
  default     = null
  type        = list(string)
  description = "IDs of the security groups for this canary"

}

variable "tags" {
  type        = map(string)
  default     = null
  description = "Key-value map of resource tags"
}