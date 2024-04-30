terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.25.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "sao-yui-project"
  region = "asia-northeast2"
  zone = "asia-northeast2-a"
  credentials = "sao-yui-project-2eaf20211d59.json"
}

resource "google_storage_bucket" "yui-1" {
  name          = "copy_this_name_and_yui1"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}