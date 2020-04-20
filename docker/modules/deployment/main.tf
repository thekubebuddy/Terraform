module "image" {
  source     = "../image"
  count      = length(var.image_name)
  image_name = "${var.image_name[count.index]}"
}


module "ghost_container" {
  source         = "../container"
  container_name = var.container_name
  image          = module.image.image_name
  int_port       = var.internal_port
  ext_port       = var.external_port

}
