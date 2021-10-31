#Create your provider configuration


#Create an EC2 Instance with Tags

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

resource "openstack_compute_instance_v2" "basic02" {
  name            = "basic02"
  image_id        = "89cf64eb-98b5-4fdd-b39e-bb7364f1feef"
  flavor_id       = "d2"
  # key_pair        = "my_key_pair_name"
  security_groups = ["default"]
    
  #Add Tags
  metadata = {
    this = "that",
    "demo" = "data",
    "some" = "more tags"
  }

  network {
    # name = "my_network"
    uuid = "590cb4c1-a0f1-4e08-bafb-140d2370afb7"
  }
}