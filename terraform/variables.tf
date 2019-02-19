variable project {
  description = "Project ID"
}

variable region {
  description = "Region"
  default     = "europe-north1"
}

variable zone {
  description = "Zone"
}

variable machineType {
  description = "machineType"
}

variable public_key_path {
  description = "public key for SSH access"
}

variable docker_disk_image {
  description = "image for generate OS"
}

variable source_ranges {
  description = "Allowed IP addresses"
  default     = ["0.0.0.0/0"]
}

variable ssh_user_name {
  description = "SSH username"
}
