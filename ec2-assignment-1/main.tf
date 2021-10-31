#Create the aws provide code. Find help at - https://registry.terraform.io/providers/hashicorp/aws/latest/docs
# provider

#Create the EC2 instance resource code. Find help at - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
# resource



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

resource "openstack_compute_instance_v2" "basic1" {
  name            = "basic1"
  image_id        = "89cf64eb-98b5-4fdd-b39e-bb7364f1feef"
  flavor_id       = "d2"
  # key_pair        = "my_key_pair_name"
  security_groups = ["default"]

  metadata = {
    this = "ping pong"
  }

  network {
    # name = "my_network"
    uuid = "590cb4c1-a0f1-4e08-bafb-140d2370afb7"
  }
}