resource "local_file" "test1" {
    filename = "/tmp/test1"
    content = "This's the test 1!"
    depends_on = [
      local_file.test2
    ]
  
}
resource "local_file" "test2" {
    filename = "/tmp/test2"
    content = "This's the test 2!"
}