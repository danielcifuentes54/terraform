resource "local_file" "remote-state-test" {
  filename = "/tmp/remote-state-test"
  content  = "remote state test!!!"
}