data "terraform_remote_state" "infra" {
  backend = "s3"
  config = {
    bucket = "terraform-state-tc5-g192-athena-v1"
    key    = "infra/terraform.tfstate"
    region = "us-east-1"
  }
}