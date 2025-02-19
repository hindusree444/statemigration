terraform {
  backend "gcs" {
    bucket      = "migrationbucket1"   
    prefix      = "terraform/state"               
  }
}

provider "google" {
  project = "statemigration"
  region  = "us-central1"
}

resource "google_compute_instance" "vm_instance" {
  name         = "my-vm"
  machine_type = "e2-medium"
  zone         = "us-central1-a"  
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      size  = 10
    }
  }

  network_interface {
    network = "default"
    access_config {
    
    }
  }
}
