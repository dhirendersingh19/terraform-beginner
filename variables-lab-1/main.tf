# provider "aws" {
#   region = "YOUR REGION"
# }

# resource "aws_instance" "test_instance" {
#   ami           = "YOUR AMI"
#   instance_type = "t2.micro"
#   tags = {
#       Name = "test_instance_1"
#       environment = "test"
#   }
# }

# resource "aws_instance" "test_instance_2" {
#   ami           = "YOUR AMI"
#   instance_type = "t2.micro"
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
  tenant_name = "admin"
  password    = var.password
  auth_url    = var.url
#   region      = "RegionOne"
}

resource "openstack_compute_instance_v2" "basic01" {
  name            = "basic01"
  image_id        = var.imageid
  flavor_id       = "d2"
  # key_pair        = "my_key_pair_name"
  security_groups = ["default"]
    
  #Add Tags
  metadata = {
    this = "that",
    "demo" = "data"
  }

  network {
    # name = "my_network"
    uuid = "590cb4c1-a0f1-4e08-bafb-140d2370afb7"
  }
}