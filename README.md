# Terraform

## [Download Terraform](https://www.terraform.io/downloads)

## [Terraform Providers](https://registry.terraform.io/browse/providers)
> There are three kinds of providers
> - Official
> - Verified
> - Community

## HCL (HashiCorp Configuraton Language)
``` terraform
 <BLOCK> <PARAMETERS> {
    KEY1 = VALUE1
    KEY2 = VALUE2
}
```

## Terraform Workflow

1. Write configuration file.
2. `Init command`
3. `Plan command`
4. `Apply command`

## Terraform State Benefits

- Tracking Metadata
- Performance
- Collaboration

## Terraform State Considerations

- Sensitive Data
- The state files should be stored in remote state backends

## Commands

> ### terraform init
> Check the configuration file and download and install the necessary plugins for our configuration file.

> ### terraform validate
> Check the configurations files.

> ### terraform plan
> show the actions that will be performed by terraform to create the resource.

> ### terraform apply
> show the execution plan, after we confirm, terraform will proceed with the creation of the resource

> ### terraform show
> show the details of the resource that was created

> ### terraform destroy
> show the execution plan with all the resources that will be destroyed, after we confirm, all the resources will be destroyed.

> ### terraform output
> show the output variables that will be created after the terraform apply

> ### terraform fmt
> Apply a format in the configuration files

> ### terraform providers
> List all the providers used in the configuration directory
> ### terraform providers mirror <PATH>
> Copy the providers plugins to another directory

> ### terraform refresh
> sync terraform with the real state of the infrastructure (this command is executed automatically when either plan or apply command is executed)

> ### terraform graph
> visual representation of the dependencies (We can use a tool like graphviz with the output of this command).

## Resources
> ``` 
> resource <PROVIDER_RESOURCE-TYPE> <RESOURCE-NAME>{
>   <RESOURCE-ARGUMENT> = <RESOURCE-ARGUMENT-VALUE>
> }
>```

> ``` 
> resource "local_file" "my-pet"{
>   filename = "/tmp/pet-name"
>   content = "My pet is called Dalton!!"
> }
>```

## Variables
> ``` 
> variable <VARIABLE-NAME> {
>   <VARIABLE-ARGUMENT> = <VARIABLE-ARGUMENT-VALUE>
> }
>```
>
> ``` 
> variable "filename"{
>  default = "/tmp/pet-name"
>  type = string
> }
>```
>
> We can set the variables in the terraform apply command
> ```
> terraform apply -var "<VAR-NAME>=<VAR-VALUE>"
> ```
> ```
> terraform apply -var "filename=/tmp/file.txt"
> ```
> We can set the variables in the environment variables
> ```sh
> export TF_VAR_<VAR-NAME>="<VAR-VALUE>"
> ```
> ``` sh
> export TF_VAR_filename="/tmp/file.txt"
> ```

## Resources attributes

> We can get the value of an attribute that will be set in the another attribute resource
> ``` 
> resource <PROVIDER_RESOURCE-TYPE> <RESOURCE-NAME>{
>   <RESOURCE-ARGUMENT> = <PROVIDER_RESOURCE-TYPE>.<RESOURCE-NAME>.<ATTRIBUTE-NAME>
> }
>```
> ``` 
> resource "local_file" "my-pet"{
>   filename = random_pet.my-random-pet.id
> }
>```

## Output Variables

- This option allows us to get information about our infrastructure after the apply command

> ``` 
> output <OUTPUT-VARIABLE-NAME> {
>   value = <PROVIDER_RESOURCE-TYPE>.<RESOURCE-NAME>.<ATTRIBUTE-NAME>
> }
>```
>
> ``` 
> output "pet_name"{
>  value = random_pet.my-pet.id
> }
>```

## Terraform Data Sources 

- Allow us to use the information defined outside of Terraform
- Only Reads infrastructure

> ``` 
> data <PROVIDER_RESOURCE-TYPE> <RESOURCE-NAME>{
>   ...
> }
>```

> ``` 
> data "local_file" "my-file-created-outside-terraform" {
>   filename = "/tmp/my-file-created-outside-terraform"
> }
>```

## Terraform Meta-Arguments

- Meta-Arguments can be used within any resource block to change the behavior of resources

1. ### Terraform Depends-On

- We can set an explicit dependency on the resource
> resource <PROVIDER_RESOURCE-TYPE> <RESOURCE-NAME>{
>   ...
>   depends_on = [<PROVIDER_RESOURCE-TYPE>.<RESOURCE-NAME>, ...]
>   ...
> }
>```

2. ### Terraform LifeCycle Rules

- Define how the resource should be created, lifecycle uses the following arguments:
    - create_before_destroy
    - prevent_destroy
    - ignore_changes
> ``` 
> resource <PROVIDER_RESOURCE-TYPE> <RESOURCE-NAME>{
>   ...
>   lifecycle {
>     create_before_destroy = true
>   }
>   ...
> }
>```

3. ### Terraform Count

- This Meta-Argument allows us to create many instances of our resource depending on the number specified.
- Creates the resources as a list
> ``` 
> resource <PROVIDER_RESOURCE-TYPE> <RESOURCE-NAME>{
>   ...
>   count = 2
>   ...
> }
>```

4. ### Terraform for-each

- This Meta-Argument allows us to create many instances of our resource depending of a set or map specified
-  We can access for-each current value with the keyword `each.value`
- Creates the resources as a map
> ``` 
> resource <PROVIDER_RESOURCE-TYPE> <RESOURCE-NAME>{
>   ...
>   for_each = var.<VARIABLE_NAME>
>   ...
> }
>```

## Terraform Version Constraints

- We can specified the provider version that we need for our configurations.

- This constrain accept other options like: `!=, >, <, ~>, ~<, >=, <=`

> ```
> terraform {
>   required_providers {
>      <PROVIDER_NAME> = {
>        source = <PROVIDER_SOURCE>
>        version = <PROVIDER_VERSION>
>      }
>    }
> }
>```

> ```
> terraform {
>   required_providers {
>      local = {
>        source = "hashicorp/local"
>        version = "2.0.0"
>      }
>    }
> }
>```