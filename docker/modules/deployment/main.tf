module "image_1" {
  source = "../image"
  # image_name = var.list_of_images[0]
  image_name = [for image in var.list_of_images : image]
}



module "ghost_container" {
  source         = "../container"
  container_name = var.container_name
  image          = module.image_1.image_name
  int_port       = var.internal_port
  ext_port       = var.external_port

}
