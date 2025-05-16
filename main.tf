terraform {
  backend "gcs" {
    bucket = "teju2018"
    prefix = "vm-harness/statefile"
  }
}

provider "google" {
  project     = var.project
  region      = var.region
}

resource "google_compute_instance" "vm_instance" {
  name         = "harness-demo-vm"
  machine_type = "e2-micro"
  zone         = "${var.region}-a"

  boot_disk {
    initialize_params {
      image = "centos-stream-9"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }


}
