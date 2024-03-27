locals {
  tag_name = var.use_locals ? "forum" : var.bucket_name  
}

resource "aws_s3_bucket" "this" {
  # bucket = "891377221357-my-tf-test-bucket"
 bucket = var.bucket_name

  tags = {
    Name        = local.tag_name
    Environment = "stage"
  }
}