provider "aws" {
  region = "us-east-2"
}

module "hello_world_app" {
  source = "../../../../modules/services/hello-world-app"

  server_text = "New server text"
  environment = "prod"

  db_remote_state_bucket = "terraform-up-and-running-state-123"
  db_remote_state_key    = "prod/data-stores/mysql/terraform.tfstate"
  instance_type          = "m4.large" # Warning: not free in AWS
  min_size               = 2
  max_size               = 10
  enable_autoscaling     = true

  custom_tags = {
    Owner      = "team-foo"
    DeployedBy = "terraform"
  }
}
