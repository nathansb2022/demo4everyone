terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">=1.3.9"
}

#ATTENTION: UPDATE YOUR VARS AND DIRECTORIES ACCORDINGLY

# Configure the AWS Provider
provider "aws" {
  region                   = "us-east-1"
  shared_config_files      = ["c:\\Users\\YourDir\\.aws\\config"]
  shared_credentials_files = ["c:\\Users\\YourDir\\.aws\\credentials"]
  profile                  = "Your-Profile"
}

resource "aws_s3_bucket" "s3_bucket" {
    bucket = "my-bucket-tf-bucket"
}

resource "aws_s3_bucket_public_access_block" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "my-bucket-policy" {
  bucket = aws_s3_bucket.s3_bucket.id
  policy = <<EOF

{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
	  "Principal": "*",
      "Action": [ "s3:GetObject" ],
      "Resource": [
        "${aws_s3_bucket.s3_bucket.arn}",
        "${aws_s3_bucket.s3_bucket.arn}/*"
      ]
    }
  ]
}
EOF
}

