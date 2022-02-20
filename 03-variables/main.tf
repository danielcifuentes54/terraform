resource "local_file" "pet" {
  filename = var.filename-from-tfvar
  content = var.content
}

resource "random_pet" "my-pet" {
  prefix = var.prefix[0]
  separator = var.separator-object["space-separator"]
  length = var.lenght["dog"]
}

resource "random_pet" "my-pet2" {
  prefix = var.pet-tupla[0]
  separator = var.pet-tupla[1]
  length = var.pet-tupla[2]
}