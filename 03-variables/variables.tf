variable "filename" {
  default = "/tmp/pet.txt"
  type = string
  description = "the filename that will be created"
}

variable "content" {
  type = string
  description = "The file content"
  default = "I love my pet Dalton"
  validation {
    condition = length(var.content) > 5
    error_message = "The content should have more than 5 characters."
  }
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

variable "test" {
  default = [10,5,1]
  type = list(number)
}