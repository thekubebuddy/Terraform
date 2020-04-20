# module "image_1" {
#   source = "../image"
#   # image_name = var.list_of_images[0]
#   image_name = [for image in var.list_of_images : image]
# }

locals {
  image_name_map = {
    image_1 = "ghost:alpine"
    image_2 = "ghost:lates"
  }
}

# Not yet implemented and details may change before release
module "x" {
  # Create an instance of this module for each element in locals.tag_Name_map
  for_each = "${locals.image_name_map}"

  source   = "../image"
  tag_Name = "${each.value}" # use each value from the map
}


# module "ghost_container" {
#   source         = "../container"
#   container_name = var.container_name
#   image          = module.image_1.image_name
#   int_port       = var.internal_port
#   ext_port       = var.external_port

# }
