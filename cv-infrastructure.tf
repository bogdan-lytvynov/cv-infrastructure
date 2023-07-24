terraform {
  backend "gcs" {
    bucket = "private-bogdan-lytvynov-cv-infrastructure-tf-state"
    prefix = "terraform/state"
  }
}

provider "google" {
  project = "swift-hangar-391602"
  region  = "europe-central2"
}

resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }
}

