# There are 3 workspaces already created (dev, test, prod)

resource "local_file" "file" {
  filename = "/tmp/${lookup(var.file-name, terraform.workspace)}"
  content  = "The current workspace is ${lookup(var.file-name, terraform.workspace)}"
}