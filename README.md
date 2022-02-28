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

## Commands

> ### `terraform init`
> Check the configuration file and download and install the necessary plugins for our configuration file.

> ### `terraform validate`
> Check the configurations files.

> ### `terraform plan`
> show the actions that will be performed by terraform to create the resource.

> ### `terraform apply`
> show the execution plan, after we confirm, terraform will proceed with the creation of the resource

> ### `terraform show`
> show the details of the resource that was created

> ### `terraform destroy`
> show the execution plan with all the resources that will be destroyed, after we confirm, all the resources will be destroyed.

> ### `terraform output`
> show the output variables that will be created after the terraform apply

> ### `terraform fmt`
> Apply a format in the configuration files

> ### `terraform providers`
> List all the providers used in the configuration directory
> ### `terraform providers mirror <PATH>`
> Copy the providers plugins to another directory

> ### `terraform refresh`
> sync terraform with the real state of the infrastructure (this command is executed automatically when either plan or apply command is executed)

> ### `terraform graph`
> visual representation of the dependencies (We can use a tool like graphviz with the output of this command).

> ### `terraform import <RESOURCE_TYPE>.<RESOURCE_NAME>`
> allows us take resources you have created by some other means and bring it under Terraform management.

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
>```
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

## Remote Backend With S3

- Allows us to save the state file in S3 and also to have state locking with DynamoDB.
- The DynamoDB table is optional and should have a primary key with the name lockID.

> ```
> terraform {
>   backend "s3" {
>     bucket = <BUCKET_NAME>
>     key = <S3_OBJECT_PATH>
>     region = <AWS_REGION>
>     dynamodb_table = <DYNAMO_TABLE>
>   }
> }
>```

> ```
> terraform {
>   backend "s3" {
>     bucket = "my-bucket"
>     key = "test/terraform.state"
>     region = "us-west-1"
>     dynamodb_table = "state-locking"
>   }
> }
>```

## Terraform State Benefits

- Tracking Metadata
- Performance
- Collaboration
- State Locking

## Terraform State Considerations

- Sensitive Data
- The state files should be stored in remote state backends

## Terraform State Sub-commands `terraform state <SUB-COMMAND> <OPTIONS>`

> ### `terraform state list`
> List all the resources in the state

> ### `terraform state mv <RESOURCE_ADDRESS> <NEW_RESOURCE_ADDRESS>`
> Move an item in the state.

> ### `terraform state pull`
Pull current state and output to stdout

> ### `terraform state push`
Update remote state from a local state file

> ### `terraform state replace-provider <CURRENT_PROVIDER> `<NEW_CURRENT_PROVIDER>
Replace provider in the state

> ### `terraform state rm <RESOURCE_ADDRESS>`
Remove instances from the state

> ### `terraform state show <RESOURCE_ADDRESS>`
Show a resource in the state

## Terraform Provisioners
- They are used inside the terraform resources
- Terraform provisioners can help us to specified actions in order to prepare our infrastructure or get some information from that one, there are 3 kinds of provisioners
1. file
2. local-exec
3. remote-exec

> ```
>  # Copies the myapp.conf file to /etc/myapp.conf
>  provisioner "file" {
>    source      = "conf/myapp.conf"
>    destination = "/etc/myapp.conf"
>  }
> ```

> ```
> #copies the private ip in the private_ips.txt
> provisioner "local-exec" {
>    command = "echo ${self.private_ip} >> private_ips.txt"
>  }
>```

> ```
>  # Establishes connection to be used by all
>  # generic remote provisioners (i.e. file/remote-exec)
>  connection {
>    type     = "ssh"
>    user     = "root"
>    password = var.root_password
>    host     = self.public_ip
>  }
>
>  provisioner "remote-exec" {
>    inline = [
>      "puppet apply",
>      "consul join ${aws_instance.web.private_ip}",
>    ]
>  }
>```

## Terraform Debugging

- Terraform provide the following environment variables for debugging

1. `TF_LOG_PATH` --> Exports the logs to specific path
2. `TF_LOG` --> Indicates the Log Level

## Terraform Taint

- Warning: This command is deprecated. For Terraform v0.15.2 and later

> ###  `terraform taint <RESOURCE_ADDRESS>`
> The resource is marked in order to be replaced

> ###  `terraform untaint <RESOURCE_ADDRESS>`
> The resource is marked in order to don't be replaced

## Terraform Modules
- Allows us created multiple resources already defined
- There are 2 kinds of modules local and remote.

> ```
>  # Local module
>  module "<MODULE_NAME>" {
>    source = <MODULE_LOCAL_PATH>
>  }
> ```

> ```
>  # Remote module
>  module "<MODULE_NAME>" {
>    source  = <MODULE_REMOTE_PATH>
>    # optional but it's recommended
>    version = <MODULE_REMOTE_VERSION>
>  }
> ```

## Terraform Functions

- Terraform provide an interactive console that can be used to test the functions `terraform console`

> ### `file(<FILE_PATH>)`
> Read data from the specified file.

> ### `length(<LIST_OR_MAP>)`
> Get the number of elements in a list or a map.

> ### `toset(<LIST>)`
> Convert list into a set.

> ### `max(<NUMBER_SET>)`
> Return the greatest number.

> ### `min(<NUMBER_SET>)`
> Return the smallest number.

> ### `ceil(<NUMBER>)`
> Round to the closest whole number that is greater than or equal to the argument.

> ### `floor(<NUMBER>)`
> Round to the closest whole number that is lesser than or equal to the argument.

> ### `split(<SEPARATOR>, <STRING>)`
> Transform a string to a list of elements.

> ### `lower(<STRING>)`
> Conver the string to upper case.

> ### `upper(<STRING>)`
> Conver the string to lower case.

> ### `index(<LIST>, <VALUE_TO_FIND>)`
> Find the location of the element in a list.

> ### `contains(<LIST>, <VALUE_TO_FIND>)`
> Return true if the value is present in the list in another case return false.

> ### `keys(<MAP>)`
> Return the keys from the specified map.

> ### `values(<MAP>)`
> Return the values from the specified map.

> ### `lookup(<MAP>, <KEY>, <OPTIONAL_VALUE>)`
> Return the value from the specified map according to key, if the key doesn't exist it will return the optional value.

## Terraform Operators

 - Numeric operators: `+, -, *, /`
 - Equality operators: `==, !+, <, >, <=, >=`
 - Logical operators: `&&, ||, !`
 - Conditional expression: `?`

## Terraform Workspaces

- Allows us to use the same configuration directory to create multiple infrastructure environments

> ### `terraform worksapace new <WORKSPACE_NAME>`
> creates a new workspace

> ### `terraform worksapace list`
> lists all the workspaces

> ### `terraform worksapace select <WORKSPACE_NAME>`
> changes the current workspace to the workspace specified

> ### `terraform.worksapace`
> returns the current workspace
> ``` 
> resource <PROVIDER_RESOURCE-TYPE> <RESOURCE-NAME>{
>   ...
>     some_property = terraform.worksapace
>   ...
> }
>```