module "dev-webserver" {
    source = "../01-AWS-instance"
    key_pair_name = "terraform-tests"
}

output "instance_id" {
  value = module.dev-webserver.instance_id
}