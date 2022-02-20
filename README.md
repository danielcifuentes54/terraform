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

> We can set an explicit dependency on the resource
> ```
> depends_on = [<PROVIDER_RESOURCE-TYPE>.<RESOURCE-NAME>, ...]
> ```

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


## Terraform LifeCycle Rules

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


## Terraform Data Sources 

- Allow us to use the information defined outside of Terraform
- Only Reads infrastructure

> ``` 
> data <PROVIDER_RESOURCE-TYPE> <RESOURCE-NAME>{
>   ...
> }
>```