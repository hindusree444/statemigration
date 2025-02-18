terraform {
  backend "gcs" {
    bucket = "terraform-statemigration"
    credentials = "C:/Users/hr352/Downloads/devops-e2e-workflow-d3118db42e64.json"
  }
}


provider "google" {
  project = "devops-e2e-workflow"
  region  = "us-central1"  # region for other resources (not the instance directly)
}

resource "google_compute_instance" "vm_instance" {
  name         = "my-vm"
  machine_type = "e2-medium"
  zone         = "us-central1-f"  # Specify the zone where the instance will be created

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      size  = 10
    }
  }

  network_interface {
    network = "default"
    access_config {
      # This enables an external IP
    }
  }
}
#
