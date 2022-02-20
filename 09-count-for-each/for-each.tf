resource "local_file" "for-each-test" {
  filename = each.value
  content  = "The for each value for this file is ${each.value}"
  for_each = var.filename-foreach
}