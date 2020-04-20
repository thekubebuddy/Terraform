module "image" {
  source = "../image"
  dynamic "image_name" {
    for_each = var.image_name
    content {
      image_name = image_name.value
    }
  }

}


module "ghost_container" {
  source         = "../container"
  container_name = var.container_name
  image          = module.image.image_name
  int_port       = var.internal_port
  ext_port       = var.external_port

}
