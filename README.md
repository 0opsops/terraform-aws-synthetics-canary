## Work in progress!!!

---

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.40 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.40 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.canary_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.canary_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.canary-policy-attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_s3_bucket.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_public_access_block.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_synthetics_canary.synthetic_canary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/synthetics_canary) | resource |
| [random_id.id](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [aws_iam_policy_document.canary_assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.canary_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_active_tracing"></a> [active\_tracing](#input\_active\_tracing) | Whether this canary is to use active AWS X-Ray tracing when it runs. | `string` | `null` | no |
| <a name="input_artifact_bucket_name"></a> [artifact\_bucket\_name](#input\_artifact\_bucket\_name) | Location in Amazon S3 where Synthetics stores artifacts from the test runs of this canary. | `string` | n/a | yes |
| <a name="input_canary_name"></a> [canary\_name](#input\_canary\_name) | Name for the canary. Has a maximum length of 21 characters. | `string` | n/a | yes |
| <a name="input_duration_in_seconds"></a> [duration\_in\_seconds](#input\_duration\_in\_seconds) | Duration in seconds, for the canary to continue making regular runs according to the schedule in the Expression value. | `number` | `null` | no |
| <a name="input_environment_variables"></a> [environment\_variables](#input\_environment\_variables) | Map of environment variables that are accessible from the canary during execution. | `map(string)` | `null` | no |
| <a name="input_failure_retention_period"></a> [failure\_retention\_period](#input\_failure\_retention\_period) | Number of days to retain data about failed runs of this canary. | `number` | `14` | no |
| <a name="input_handler"></a> [handler](#input\_handler) | Entry point to use for the source code when running the canary. This value must end with the string `.handler` | `string` | n/a | yes |
| <a name="input_memory_in_mb"></a> [memory\_in\_mb](#input\_memory\_in\_mb) | Maximum amount of memory available to the canary while it is running, in MB. | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | n/a | yes |
| <a name="input_runtime_version"></a> [runtime\_version](#input\_runtime\_version) | Runtime version to use for the canary. Versions change often so consult the Amazon CloudWatch documentation for the latest valid versions. | `string` | `"syn-python-selenium-1.3"` | no |
| <a name="input_schedule_expression"></a> [schedule\_expression](#input\_schedule\_expression) | Configuration block providing how often the canary is to run and when these test runs are to stop | `string` | n/a | yes |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | IDs of the security groups for this canary | `list(string)` | `null` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | IDs of the subnets where this canary is to run | `list(string)` | `null` | no |
| <a name="input_success_retention_period"></a> [success\_retention\_period](#input\_success\_retention\_period) | Number of days to retain data about successful runs of this canary. | `number` | `2` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Key-value map of resource tags | `map(string)` | `null` | no |
| <a name="input_timeout_in_seconds"></a> [timeout\_in\_seconds](#input\_timeout\_in\_seconds) | Number of seconds the canary is allowed to run before it must stop. | `string` | `null` | no |
| <a name="input_zip_file_path"></a> [zip\_file\_path](#input\_zip\_file\_path) | ZIP file that contains the script. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_canary_arn"></a> [canary\_arn](#output\_canary\_arn) | Amazon Resource Name (ARN) of the Canary |
| <a name="output_canary_id"></a> [canary\_id](#output\_canary\_id) | Name for this canary |
| <a name="output_canary_status"></a> [canary\_status](#output\_canary\_status) | Canary status |
| <a name="output_engine_arn"></a> [engine\_arn](#output\_engine\_arn) | ARN of the Lambda function that is used as your canary's engine |
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | Amazon Resource Name (ARN) specifying the role |
| <a name="output_role_name"></a> [role\_name](#output\_role\_name) | Name of the role |
| <a name="output_s3_bucket_arn"></a> [s3\_bucket\_arn](#output\_s3\_bucket\_arn) | ARN of s3 bucket |
| <a name="output_s3_bucket_name"></a> [s3\_bucket\_name](#output\_s3\_bucket\_name) | Name of s3 bucket |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | ID of the VPC where this canary is to run. |
<!-- END_TF_DOCS -->