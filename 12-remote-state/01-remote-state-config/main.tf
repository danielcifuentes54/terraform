resource "aws_dynamodb_table" "cars" {
  name         = "state-locking"
  hash_key     = "LockID"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "LockID"
    type = "S"
  }
}

resource "aws_s3_bucket" "my-bucket" {
  bucket        = "decc-bucket-created-with-terraform"
  force_destroy = true
}