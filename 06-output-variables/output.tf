output "pet_name" {
  value = random_pet.my-pet.id
  sensitive = true
}