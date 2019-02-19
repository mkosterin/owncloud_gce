provider "google" {
  version = "1.20.0"
  project = "${var.project}"
  region  = "${var.region}"
}

resource "google_compute_instance" "docker-1" {
  name         = "docker-1"
  machine_type = "${var.machineType}"
  zone         = "${var.zone}"
  tags         = ["docker-node"]

  boot_disk {
    initialize_params {
      image = "${var.docker_disk_image}"
    }
  }

  network_interface {
    network = "default"

    access_config = {
      nat_ip = "${google_compute_address.docker_ip.address}"
    }
  }

  metadata {
    ssh-keys = "${var.ssh_user_name}:${file(var.public_key_path)}"
  }
}

resource "google_compute_address" "docker_ip" {
  name = "docker-ip"
}

resource "google_compute_firewall" "firewall_http" {
  name    = "default-allow-http"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = "${var.source_ranges}"
}

resource "google_compute_firewall" "firewall_https" {
  name    = "default-allow-https"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  source_ranges = "${var.source_ranges}"
}

resource "google_compute_firewall" "firewall_ssh" {
  name    = "default-allow-ssh"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = "${var.source_ranges}"
}
