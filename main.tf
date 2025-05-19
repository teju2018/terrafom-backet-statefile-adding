provider "google" {
  project = "clam-458312"
  region  = "us-central1"
}

# 1. GCS Bucket to store state files or other artifacts
resource "google_storage_bucket" "terraform_state" {
  name     = "teju2018"
  zone = "us-central1-c"

  versioning {
    enabled = true
  }

  uniform_bucket_level_access = true

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 365
    }
  }
}

# 2. Google Compute VM instance
resource "google_compute_instance" "vm_instance" {
  name         = "harness-demo-vm"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "centos-stream-9"
    }
  }

  network_interface {
    network       = "default"
    access_config {}
  }
}
