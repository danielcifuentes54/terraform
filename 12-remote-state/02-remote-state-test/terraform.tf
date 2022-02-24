terraform {
  backend "s3" {
    bucket         = "decc-bucket-created-with-terraform"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "state-locking"
  }
}