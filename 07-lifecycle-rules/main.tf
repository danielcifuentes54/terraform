resource "local_file" "prevent_destroy" {
  filename = "/tmp/prevent_destroy.txt"
  content  = "This file won't be destroyed with the apply command!"
  lifecycle {
    prevent_destroy = true
  }
}

resource "random_string" "create_before_destroy" {
    length = 12
    lifecycle {
        create_before_destroy =  true
    }
}

resource "local_file" "ignore_changes" {
  filename = "/tmp/ignore_changes.txt"
  content  = "This file will be ignore this changes"
  lifecycle {
    ignore_changes = [
      content
    ]
  }
}