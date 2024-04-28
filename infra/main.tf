resource "google_sql_database_instance" "default" {
  name             = "sampleapp-db"
  database_version = "MYSQL_8_0"
  region           = "europe-west2"

  settings {
    tier = "db-f1-micro"
  }
}

resource "google_sql_database" "default" {
  name       = "sampleapp"
  instance   = google_sql_database_instance.default.name
}

output "public_ip_address" {
  value = google_sql_database_instance.default.ip_address
}

resource "google_sql_user" "default" {
  name = var.db_user
  password = var.db_pass
  instance = google_sql_database_instance.default.name
}
resource "google_artifact_registry_repository" "repository" {

  location = "europe-west2"
  repository_id = "sample-app-repo"
  description = "My repository for the Sample App Docker image"
  format = "DOCKER"
}

resource "google_container_cluster" "primary" {
  name     = "sampleapp-autopilot-cluster"
  location = "europe-west2"

 enable_autopilot = true

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}