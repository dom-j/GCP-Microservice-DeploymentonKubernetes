
# Microservice Deployment on Kubernetes with Terraform in GCP <!-- omit in toc -->

- [1. Introduction](#1-introduction)
- [2. Architecture diagram](#2-architecture-diagram)
- [3. Prerequisites](#3-prerequisites)
- [4. Steps:](#4-steps)
  - [4.1. Step 1: Set up the GCP project](#41-step-1-set-up-the-gcp-project)
  - [4.2. Step 2: Python Flask Microservice](#42-step-2-python-flask-microservice)
  - [4.3. Step 3: Dockerfile and the docker image](#43-step-3-dockerfile-and-the-docker-image)
  - [4.4. Step 4: Kubernetes manifest files](#44-step-4-kubernetes-manifest-files)
  - [4.5. Step 5: Cloud SQL Auth Proxy](#45-step-5-cloud-sql-auth-proxy)
  - [4.6. Step 6: Testing and troubleshooting](#46-step-6-testing-and-troubleshooting)
  
## 1. Introduction

This project demonstrates deploying a RESTful microservice called 'SampleApp' to a Google Kubernetes Engine (GKE) cluster in GCP. The service retrieves the current date/time from a Cloud SQL database (accessed via Cloud SQL Auth Proxy) and exposes it through a RESTful API. Docker is used for containerization, with the image stored in Artifact Registry. Kubernetes manifests manage deployment, and a load balancer routes incoming traffic.

## 2. Architecture diagram

!
- **Microservice:** SampleApp
- **Deployment platform:** Google Kubernetes Engine (GKE)
- **Database:** Cloud SQL with Cloud SQL Auth Proxy
- **Containerization:** Docker image stored in Artifact Registry
- **Deployment configuration:** Kubernetes manifests
- **Service exposure:** Load balancer

## 3. Prerequisites

**Cloud Resources:**

- [Google Cloud Platform](https://console.cloud.google.com/welcome?project=microservice-on-kubernetes) account and project
- Service accounts with required permissions
- Enabled APIs: Cloud SQL Admin API, Kubernetes Engine API, Artifact Registry API, IAM Service Account Credentials API
- Cloud SQL instance, database, and user (created with Terraform)
- Artifact Registry for storing the Docker image
- Google Kubernetes Engine cluster
- Cloud SQL Auth Proxy for connecting to the Cloud SQL instance from the GKE cluster

**Development Environment:**

- Code editor: [VS Code](https://code.visualstudio.com/download) (optional)
- [Terraform](https://developer.hashicorp.com/terraform/install) for provisioning infrastructure
- [Python](https://www.python.org/downloads/windows/) (for building the Flask microservice)
- [Docker](https://www.docker.com/products/docker-desktop/) for containerization

**Kubernetes Tools:**

- [kubectl](https://kubernetes.io/docs/tasks/tools/) for interacting with the Kubernetes cluster

## 4. Steps:

### 4.1. Step 1: Set up the GCP project

- Create a new project in GCP
- Create a service account with the required permissions (e.g. Storage Admin, Kubernetes Engine Admin, Artifact Registry Admin, Service Account User)
  -Add a key to the service account and download the JSON file 
- Enable the necessary APIs: Cloud SQL Admin API, Kubernetes Engine API, Artifact Registry API, IAM Service Account Credentials API
- Create the Terraform files: 
    ```
    provider.tf - GCP provider configuration
    variables.tf - Input variables for the Terraform configuration
    main.tf - Terraform configuration for creating the Cloud SQL instance, database, and user
    terraform.tfvars - Variable values for the Terraform configuration
    ```
**NOTE:** Make sure to include sensitive information in your gitignore file and do not expose them in the main code or in GitHub.

- Run `terraform init` to initialize the Terraform configuration
- Run `terraform plan` to view the resources that will be created
- Run `terraform apply` to create the Cloud SQL instance, database, and user

### 4.2. Step 2: Python Flask Microservice

- Build a simple Python Flask microservice (using Terraform) that retrieves the current date/time from a Cloud SQL database
  
  - **sample-app.py:** Python Flask code for the microservice 

### 4.3. Step 3: Dockerfile and the docker image

### 4.4. Step 4: Kubernetes manifest files

### 4.5. Step 5: Cloud SQL Auth Proxy

### 4.6. Step 6: Testing and troubleshooting


1. Set up the GCP project 
2. Create the service account in GCP
3. Add the required permissions to the service account
4. Enable the required APIs e.g. Cloud SQL Admin API, Kubernetes Engine API and Artifact Registry API
5. Create the Cloud SQL instance and database and user in GCP with Terraform 
6. Make sure you do not expose sensitive information in the main code and in GitHub - define them in variables
7. Build the microservice using Python flask 
8. Create the Dockerfile for the microservice 
9. Create Artifact Registry in GCP and push the image to the registry
10. Build the Docker image - make sure you tag it correctly to be able to push it to artifact registry
11. Push the Docker image to the Artifact Registry (do not forget to authenticate docker to the Artifact Registry)
12. Create the GKE cluster - better in Terraform  (do not forget to authenticate the GKE cluster with the service account)
13. CLOUD SQL Auth Proxy - to connect to the Cloud SQL instance from the GKE cluster (Workload Identity - GSA and KSA)
14. You can store the database user credentials in the Kubernetes secrets - create the secrets in the GKE cluster
15. Create and deploy the kubernetes manifest deployment file for the microservice
16. Create and deploy the kubernetes manifest service file for the microservice
17. Create and deploy the kubernetese manifest KSA file for the microservice
18. 

