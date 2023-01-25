#  Location in Amazon S3 where Synthetics stores artifacts from the test runs of this canary.

resource "random_id" "id" {
  byte_length = 4
}

resource "aws_s3_bucket" "bucket" {
  bucket        = "${var.artifact_bucket_name}-${random_id.id.hex}"
  force_destroy = true
}

resource "aws_s3_bucket_acl" "bucket" {
  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_public_access_block" "bucket" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
