output "cloud_run_service_name" {
  value = google_cloud_run_v2_service.agent_service.name
}

output "cloud_run_uri" {
  value = google_cloud_run_v2_service.agent_service.uri
}

output "service_account_email" {
  value = google_service_account.agent_service.email
}

output "artifact_registry_repository" {
  value = google_artifact_registry_repository.agent_repo.name
}
