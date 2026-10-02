resource "google_service_account" "agent_service" {
  account_id   = "tf-agent-${var.environment}"
  display_name = "Terraform Agent Platform ${var.environment}"
}

resource "google_artifact_registry_repository" "agent_repo" {
  location      = var.region
  repository_id = "agent-platform-${var.environment}"
  description   = "Container repository for ${var.environment} agent platform"
  format        = "DOCKER"
}

resource "google_cloud_run_v2_service" "agent_service" {
  name     = "${var.service_name}-${var.environment}"
  location = var.region

  template {
    service_account = google_service_account.agent_service.email

    containers {
      image = var.container_image

      env {
        name  = "ENVIRONMENT"
        value = var.environment
      }
    }
  }

  deletion_protection = false
}
