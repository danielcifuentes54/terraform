resource "local_file" "file_test" {
  filename = "/tmp/file_test.txt"
  content = "This file was created by terraform"
  file_permission = "0700"
}