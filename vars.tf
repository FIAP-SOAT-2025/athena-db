variable "projectName" {
  description = "The name of the project"
  default     = "tc5-g192-athena-v1"
}

variable "tf_state_bucket" {
  description = "S3 bucket name used for Terraform state and remote state lookup."
  type        = string
  default     = "terraform-state-tc5-g192-athena-v1"
}

variable "infra_remote_state_key" {
  description = "State key for the infra stack consumed via terraform_remote_state."
  type        = string
  default     = "tc5-g192-athena-v1/infra/terraform.tfstate"
}

variable "db_state_key" {
  description = "State key for this DB stack backend."
  type        = string
  default     = "tc5-g192-athena-v1/db/terraform.tfstate"
}

variable "videos_bucket_name" {
  description = "Application videos bucket name (kept for cross-module naming consistency)."
  type        = string
  default     = "athena-videos-tc5-g192-v1"
}

variable "db_user" {
  description = "O nome de usuário para o banco de dados RDS."
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "A senha para o usuário do banco de dados RDS."
  type        = string
  sensitive   = true
}

variable "access_token" {
  description = "O Access Token para integração com APIs externas."
  type        = string
  sensitive   = true
}


variable "db_name" {
  description = "O nome do banco de dados inicial a ser criado na instância RDS."
  type        = string
}
