provider "aws" {
  region = "us-east-2"
}

module "hello_world_app" {
  source = "../../../modules/services/hello-world-app"

  server_text = "New server text"
  environment = "stage"

  db_remote_state_bucket = "terraform-up-and-running-state-123"
  db_remote_state_key    = "stage/data-stores/mysql/terraform.tfstate"
  instance_type          = "t2.micro"
  min_size               = 2
  max_size               = 2
  enable_autoscaling     = false
}
