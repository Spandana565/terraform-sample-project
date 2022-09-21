# terraform-sample-project
This codebase is an example of how to use Terraform to create an AWS EC2 instance on which Jenkins and on which Ansible Playbook is used to deploy a web application.

The steps to run this code are as follows:
- Install Terraform 
- Set the variables in the .tf files and .tfvar files.
- Run Terraform
  
## Install Terraform
Terraform can be downloaded and installed from the official website:
https://www.terraform.io/downloads.

## Setting the Variables
Within provider.tf, set the variables *region* to the region where the AWS VM should be created. See below for example. 

<pre><code>
  region  = "eu-north-1"
</code></pre> 

Within terraform.tfvar, set the variable *amazon_ami* to point to a sample Amazon Machine Image (AMI) to create a VM. The variable *my_access_cidr* should be set to your public IP address. The variable *key_file_path* should be set to the location of the AWS keypair. The variable *region* should be same as the *region* variable in provider.tf and should point to the region where the AWS VM should be created. The variable *vpc_id* and *subnet_id* to the Virtual Private Cloud (VPC) ID and Subnet ID, respectively. 

<pre><code>
amazon_ami = "ami078e13ebe3b027f1c"
my_access_cidr =  "217.213.74.72/32"
key_file_path = "../../Keys/Terraform.pem"
key_name = "Terraform"
region = "eu-north-1"
vpc_id = "vpc-033cd8e4f2e9xxxxx"
subnet_id = "subnet-0947c9dad074xxxxx"
</code></pre> 

Within backend.tf, details about the S3 bucket used to store the Terraform State file *terraform.tfstate* should be specified. The name of the bucket should be assigned to *bucket* and the *region* variable chosen to be same as *region* variable specified in previously mentioned files. 

<pre><code>
    bucket = "terraformxxxx"
    region = "eu-north-1"
</code></pre>

## Running Terraform

After setting the variables, one can open a shell on the machine on which Terraform installed and run the below commands. The first command initializes Terraform, the second command displays the additions or changes to the infrastructure and the last command builds (if executed for first time) or applies the same changes to the infrastructure (if run again with different parameters). 

<pre><code>
terraform init
terraform plan
terraform apply
</code></pre>
