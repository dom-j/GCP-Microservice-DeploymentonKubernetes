
# Create the the Google Cloud SQL database instance
resource "google_sql_database_instance" "default" {
  name             = "sampleapp-db"
  database_version = "MYSQL_8_0"
  region           = "europe-west2"

  settings {
    tier = "db-f1-micro"
  }
}

# Create the database
resource "google_sql_database" "default" {
  name       = "sampleapp"
  instance   = google_sql_database_instance.default.name
}

# Create the database user
resource "google_sql_user" "default" {
  name = var.db_user
  password = var.db_pass
  instance = google_sql_database_instance.default.name
}

# Create the Artifact Registry repository
resource "google_artifact_registry_repository" "repository" {

  location = "europe-west2"
  repository_id = "sample-app-repo"
  description = "It stores my sample-app docker image"
  format = "DOCKER"
}

# Create the Google Kubernetes Engine cluster
resource "google_container_cluster" "primary" {
      name     = "sampleapp-autopilot-cluster"
      location = "europe-west2"
      enable_autopilot = true 
    master_auth {  
      client_certificate_config {
      issue_client_certificate = false
    }
      }
    }

resource "kubernetes_secret" "default" {
  metadata {
    name = "db-credentials"
  }

  data = {
    username = base64encode(var.db_user)
    password = base64encode(var.db_pass)
  }

  type = "Opaque"
}