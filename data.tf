data "terraform_remote_state" "infra" {
  backend = "s3"
  config = {
    bucket = "terraform-state-tc5-athena"
    key    = "infra/terraform.tfstate"
    region = "us-east-1"
  }
}