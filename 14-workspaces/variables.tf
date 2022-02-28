variable "file-name" {
    type = map
    default = {
        "dev" = "my-dev-file.txt"
        "test" = "my-test-file.txt"
        "prod" = "my-prod-file.txt"
    }

}