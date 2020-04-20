module "image" {
  source     = "../image"
  for_each   = var.image_name
  image_name = each.value
}


module "ghost_container" {
  source         = "../container"
  container_name = var.container_name
  image          = module.image.image_name
  int_port       = var.internal_port
  ext_port       = var.external_port

}
