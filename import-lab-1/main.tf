#Provider block
# provider "aws" {
#     region = "YOUR REGION HERE"
# }

#Resource code for instance you are importing

#Openstack Provider

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

resource "openstack_blockstorage_volume_v3" "volume_1" {
#   region      = "RegionOne"
  name        = "volume_1"
  description = "first test volume"
  size        = 3
}
# terraform import openstack_blockstorage_volume_v3.volume_1 f024ff66-2f31-4ae6-866f-efd3b1160e08
