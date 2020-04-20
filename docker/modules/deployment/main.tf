module "image" {
  source     = "../image"
  count      = var.my_count
  image_name = "${var.list_of_images[count.index % length(var.list_of_images)]}"
}


module "ghost_container" {
  source         = "../container"
  container_name = var.container_name
  image          = module.image.image_name
  int_port       = var.internal_port
  ext_port       = var.external_port

}
