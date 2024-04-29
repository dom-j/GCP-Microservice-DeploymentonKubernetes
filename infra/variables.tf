variable "gcp_svc_key" {
  
}

variable "gcp_project" {
  
}

variable "gcp_region" {
  
}
variable "db_user" {
  description = "The database username"
  type = string
}

variable "db_pass" {
  description = "value of the database password"
  type = string
  sensitive = true
  }

  variable "gke_connection"{
    description = "The service account email address for the GKE connection"
    type = string
  }
  variable "ksa"{
    description = "The Kubernetes service account name"
    type = string
  }