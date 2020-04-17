provider "google" {
  version     = "3.5.0"
  credentials = file("/downloads/terraform.json")
  project     = var.project
  region      = var.region
  zone        = var.zone
}




resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_network
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "public-sb-1" {
  name          = var.subnetwork
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc_network.name
}



resource "google_compute_firewall" "default" {

  name    = "default-firewall"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000", "22"]
  }
  target_tags   = ["haproxy"]
  source_ranges = ["103.106.137.83/32"]

}




# resource "google_compute_address" "internal_with_subnet_and_address" {
#   name         = "my-internal-address"
#   subnetwork   = google_compute_subnetwork.default.id
#   address_type = "INTERNAL"
#   address      = "10.0.42.42"
#   region       = "us-central1"
# }

resource "google_compute_address" "static_external_ip" {
  name = "haproxy-instance-external-ip"
}


resource "google_compute_instance" "vm_instance" {
  name         = "haproxy-instance1"
  machine_type = var.machine_type
  zone         = var.zone
  tags         = ["haproxy"]
  boot_disk {
    initialize_params {
      image = var.image_name
      type  = "pd-standard"
      size  = "100"
    }
  }

  network_interface {
    network    = var.vpc_network
    subnetwork = var.subnetwork
    network_ip = var.static_internal_ip
    access_config {
      nat_ip = google_compute_address.static_external_ip.name
    }
  }
  service_account {
    scopes = ["cloud-platform"]
  }
}
