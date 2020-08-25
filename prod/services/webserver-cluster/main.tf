provider "aws" {
  region = "us-east-2"
}

module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster_name           = "webservers-prod"
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
