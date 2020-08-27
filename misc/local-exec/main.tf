provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "example-local-exec" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  provisioner "local-exec" {
    command = "echo \"Hello, World from $(whoami) at $(hostname)\""
  }
}
