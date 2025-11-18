terraform {
required_providers {
aws = {
source = "hashicorp/aws"
version = "~> 4.0"
}
}
}


provider "aws" {
region = var.aws_region
}


variable "aws_region" {
default = "us-east-1"
}


variable "bucket_name" {
type = string
}


resource "aws_s3_bucket" "compliance_docs" {
bucket = var.bucket_name
acl = "private"
}


resource "aws_s3_bucket_lifecycle_configuration" "compliance_lifecycle" {
bucket = aws_s3_bucket.compliance_docs.id


rule {
id = "ComplianceProjectDocsLifecycle"
status = "Enabled"


filter {
prefix = "projects/"
}


transition {
days = 90
storage_class = "STANDARD_IA"
}


expiration {
days = 2555
}


noncurrent_version_expiration {
noncurrent_days = 2555
}
}
}
