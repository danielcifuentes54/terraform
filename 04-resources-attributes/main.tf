resource "local_file" "pet" {
  filename = "/tmp/my_pet_${random_pet.pet-name.id}"
  content = "My pet's name is: ${random_pet.pet-name.id}"
}

resource "random_pet" "pet-name" {
  prefix = "Mr"
  separator = "_"
  length = 1
}