terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.0.0"
    }
  }
}

resource "local_file" "test-version-constraint" {
  filename = "/tmp/version"
  content  = "The version should be 2.0.0"
}
