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
