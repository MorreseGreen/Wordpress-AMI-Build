packer {
  required_plugins {
    amazon = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}

source "amazon-ebs" "wordpress" {
  ami_name = "wordpress-website-${local.timestamp}"

  source_ami_filter {
    filters = {
      name                = "*ubuntu-focal-20.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }


  instance_type = "t2.micro"
  region = "us-east-1"
  ssh_username = "ubuntu"
  iam_instance_profile = "wordpress_server_profile"
}

build {
  sources = [
    "source.amazon-ebs.wordpress"
  ]
    provisioner "ansible" {
    playbook_file = "./ansible/main-playbook.yml"
  }

}