module "image" {
  source     = "../image"
  image_name = "${var.image_name}"
}


module "ghost_container" {
  source         = "../container"
  container_name = var.container_name
  image          = module.image.image_name
  int_port       = var.internal_port
  ext_port       = var.external_port

}
