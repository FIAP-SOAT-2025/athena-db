terraform {
  backend "s3" {
    bucket = "terraform-state-tc5-g192-athena-v1"
    key    = "tc5-g192-athena-v1/db/terraform.tfstate"
    region = "us-east-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.13.0"
    }
  }
}
