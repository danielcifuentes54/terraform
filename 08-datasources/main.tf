resource "local_file" "my-file" {
    filename = "/tmp/my-file"
    content = data.local_file.my-file-created-outside-terraform.content
}

data "local_file" "my-file-created-outside-terraform" {
  filename = "/tmp/my-file-created-outside-terraform"
}