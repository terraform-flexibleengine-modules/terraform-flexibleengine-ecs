module "basic_ecs" {
  source = "../../"

  instance_name     = "ecs-basic"
  instance_count    = 3
  availability_zone = "eu-west-0a"

  flavor_name     = "t2.small"
  key_name        = var.key_pair
  security_groups = var.security_group_id
  subnet_id       = var.subnet_id
  network_id      = var.network_id

  existing_eip = var.existing_eip

  block_devices = [
    {
      uuid                  = "<ImageID>"
      source_type           = "image"
      destination_type      = "volume"
      volume_size           = 50
      boot_index            = 0
      delete_on_termination = true
    }
  ]

  metadata = {
    Terraform   = "true"
    Environment = "dev"
  }
}
