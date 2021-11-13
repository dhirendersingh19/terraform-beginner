# provider "aws" {
#     region = "YOUR REGION"
# }

# resource "aws_instance" "tags-test" {
#     ami = "YOUR AMI"
#     instance_type = "t2.micro"
# }

# resource "aws_ebs_volume" "example" {
#   availability_zone = "YOUR AZ"
#   size              = 40
# }

# resource "aws_volume_attachment" "ebs_att" {
#   device_name = "/dev/sdh"
#   volume_id   = 
#   instance_id = 
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

resource "openstack_compute_instance_v2" "basic01" {
  name            = "basic01"
  image_id        = "89cf64eb-98b5-4fdd-b39e-bb7364f1feef"
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

resource "openstack_compute_volume_attach_v2" "va_1" {
  instance_id = "${openstack_compute_instance_v2.basic01.id}"
  volume_id   = "${openstack_blockstorage_volume_v3.volume_1.id}"
}