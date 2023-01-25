# IAM role to be used to run the canary. see AWS Docs for permissions needs for IAM Role.
# https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries.html
data "aws_iam_policy_document" "canary_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"

    principals {
      identifiers = ["lambda.amazonaws.com"]
      type        = "Service"
    }
  }
}

resource "aws_iam_role" "canary_role" {
  name               = "${var.canary_name}-canary-role"
  assume_role_policy = data.aws_iam_policy_document.canary_assume_role_policy.json
  description        = "${var.canary_name} IAM role for AWS Synthetic Monitoring Canaries"
}


data "aws_iam_policy_document" "canary_policy" {
  statement {
    sid       = ""
    effect    = "Allow"
    resources = ["${aws_s3_bucket.bucket.arn}"]

    actions = [
      "s3:PutObject",
      "s3:GetObject",
    ]
  }

  statement {
    sid       = ""
    effect    = "Allow"
    resources = ["${aws_s3_bucket.bucket.arn}"]
    actions   = ["s3:GetBucketLocation"]
  }

  statement {
    sid       = ""
    effect    = "Allow"
    resources = ["*"]
    actions   = ["cloudwatch:PutMetricData"]

    condition {
      test     = "StringEquals"
      variable = "cloudwatch:namespace"
      values   = ["CloudWatchSynthetics"]
    }
  }

  statement {
    sid       = ""
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "s3:ListAllMyBuckets",
      "xray:PutTraceSegments",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:CreateLogGroup",
      "lambda:PublishLayerVersion",
      "ec2:DescribeNetworkInterfaces",
      "ec2:CreateNetworkInterface",
      "ec2:DeleteNetworkInterface",
      "ec2:DescribeInstances",
      "ec2:AttachNetworkInterface"
    ]
  }
}

resource "aws_iam_policy" "canary_policy" {
  name        = "${var.canary_name}-canary-policy"
  policy      = data.aws_iam_policy_document.canary_policy.json
  description = "${var.canary_name} IAM policy for AWS Synthetic Monitoring Canaries"
}

resource "aws_iam_role_policy_attachment" "canary-policy-attachment" {
  role       = aws_iam_role.canary_role.name
  policy_arn = aws_iam_policy.canary_policy.arn
}