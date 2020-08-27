resource "null_resource" "example" {
  triggers = {
    uuid = uuid()
  }

  provisioner "local-exec" {
    command = "echo \"Hello, World from $(whoami) at $(hostname)\""
  }
}
