# #For your module code!!!
# resource "aws_instance" "example" {
#     ami = data.aws_ami.windows.id
#     instance_type = "t2.micro"
# }

# #Put Data for ami filter below

# data "aws_ami" "windows"{
#     most_recent = true

#     filter {
#         name = "name"
#         values = ["Windows*"]
#     }

#     filter {
#         name ="virtualization-type"
#         values = ["hvm"]
#     }

#     owners = ["000"]
# }


# // aws ec2 describe-images --owners amazon --image-ids <id>

terraform {
required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.35.0"
    }
  }
}
resource "openstack_blockstorage_volume_v3" "volume_1" {
#   region      = "RegionOne"
  name        = "volume_1"
  description = "first test volume"
  size        = 3
}