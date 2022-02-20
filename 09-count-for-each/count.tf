resource "local_file" "count-test" {
  filename = var.filename[count.index]
  content  = "The count for this file is ${count.index}"
  count    = length(var.filename)
}