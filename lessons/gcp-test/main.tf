provider "google" {
  credentials = file("mygpc-creds.json")
  project     = "sunlit-market-339812"
  region      = "eu-central1"
  zone        = "eu-central1-b"
}

resource "google_compute_instance" "my-server" {
  name         = "my-gpc-server"
  machine_type = "f1.micro"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    network = "default"
  }
}
