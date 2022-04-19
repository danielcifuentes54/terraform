provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  region = "ca-central-1"
  alias = "central"
}