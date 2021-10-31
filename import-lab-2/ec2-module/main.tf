# #For your module code!!!
# resource "aws_instance" "example" {
#     ami = data.aws_ami.windows.id
#     instance_type = "t2.micro"
# }

# #AMI Filter for Windows Server 2019 Base
# data "aws_ami" "windows" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["Windows_Server-2019-English-Full-Base-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["801119661308"] # Canonical
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
