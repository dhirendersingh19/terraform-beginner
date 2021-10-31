# #Provider block
# provider "aws" {
#     region = "YOUR REGION HERE"
# }

# #EC2 Module Code


# Define required providers
terraform {
required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.35.0"
    }
  }
}

# Configure the OpenStack Provider
provider "openstack" {
  user_name   = "admin"
  tenant_name = "admin"
  password    = "secret"
  auth_url    = "http://192.168.0.187/identity"
#   region      = "RegionOne"
}


module "import_instance" {
  source = "./ec2-module"
  
}


# terraform import module.import_instance.openstack_compute_instance_v2.basic01 399d3ab7-2ab2-41da-84f1-d7d7fdd5ec53