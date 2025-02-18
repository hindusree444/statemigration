terraform {
  backend "gcs" {
    bucket      = "migrationbucket1"   # GCS bucket name
    prefix      = "terraform/state"                # Path to store the state file within the bucket (optional)
    credentials = "C:/Users/hr352/Downloads/statemigration-152f2dfa7870.json" # Path to your service account credentials file
  }
}

provider "google" {
  project = "statemigration"
  region  = "us-central1"
  credentials = "C:/Users/hr352/Downloads/statemigration-152f2dfa7870.json"
}

resource "google_compute_instance" "vm_instance" {
  name         = "my-vm"
  machine_type = "e2-medium"
  zone         = "us-central1-a"  # Specify the zone where the instance will be created

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
