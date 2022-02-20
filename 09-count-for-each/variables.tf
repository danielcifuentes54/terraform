variable "filename" {
  default = [
    "/tmp/test-count1",
    "/tmp/test-count2",
    "/tmp/test-count3"
  ]
  type = list(string)
}

variable "filename-foreach" {
  default = [
    "/tmp/test-for-each1",
    "/tmp/test-for-each2",
    "/tmp/test-for-each3"
  ]
  type = set(string)
}