# provider "aws" {
#   region = var.region
# }

# resource "aws_instance" "test_instance" {
#   ami           = var.image_id
#   instance_type = var.instance_type
#   tags = {
#       Name = "test_instance_1"
#       environment = "test"
#   }
# }

# resource "aws_instance" "test_instance_2" {
#   ami           = var.image_id
#   instance_type = var.instance_type
#   tags = {
#       Name = "test_instance_2"
#       environment = "test"
#   }
# }

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
  user_name   = var.username
  tenant_name = var.tenant_name
  password    = var.password
  auth_url    = var.url
#   region      = "RegionOne"
}

resource "openstack_blockstorage_volume_v3" "volume_1" {
#   region      = "RegionOne"
  name        = "volume_1"
  description = "first test volume"
  size        = 3
}