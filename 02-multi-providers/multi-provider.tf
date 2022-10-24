resource "local_file" "my-pet"{
    filename = "/tmp/pet-name"
    content = "My pet is called Dalton!!"
}

resource "random_pet" "other-pet" {
  length = "2"
  prefix = "Mr"
  separator = " "
}

resource "random_integer" "priority" {
  min = 10000
  max = 99999
}

output "name" {
  value = random_integer.priority
}