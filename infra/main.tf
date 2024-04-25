resource "google_sql_database_instance" "default" {
  name             = "sampleapp-db"
  database_version = "MYSQL_8_0"
  region           = "us-central1"

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