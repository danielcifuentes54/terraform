resource "aws_s3_bucket" "my-bucket" {
  bucket = "decc-bucket-created-with-terraform"
}

resource "aws_s3_bucket_object" "upload" {
  bucket = aws_s3_bucket.my-bucket.id
   key    = "test.txt"
  source = "./test.txt"
}