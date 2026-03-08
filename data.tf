data "terraform_remote_state" "infra" {
  backend = "s3"
  config = {
    bucket = var.tf_state_bucket
    key    = var.infra_remote_state_key
    region = "us-east-1"
  }
}