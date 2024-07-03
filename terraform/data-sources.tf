# data "aws_ami" "alma_linux_9" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["AlmaLinux OS 9*"]
#   }

#   filter {
#     name   = "architecture"
#     values = ["x86_64"]
#   }

#   filter {
#     name   = "root-device-type"
#     values = ["ebs"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   filter {
#     name   = "hypervisor"
#     values = ["xen"]
#   }

#   owners = ["amazon", "aws-marketplace", "self"]
# }
