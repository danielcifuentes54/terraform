variable "filename" {
  default = "/tmp/pet.txt"
  type = string
  description = "the filename that will be created"
}

variable "content" {
  default = "I love my pet Dalton"
}

variable "prefix" {
  default = ["Mr", "Mrs", "Sir"]
  type = list(string)
}

variable "separator-set" {
  default = [" ", ".", ",", "-"]
  type = set(string)
}

variable "separator-object" {
  default = {
      space-separator = " ",
      dash-separator = "-",
  }
  type = object({
      space-separator = string,
      dash-separator = string
  })
}

variable "lenght" {
  default = {
    "dog" = 2
    "cat" = 1
  }
  type = map(number)
}

variable "pet-tupla" {
  type = tuple([string, string, number])
  default = ["Mrs", "-", 3]
}

variable "filename-from-tfvar"{
}