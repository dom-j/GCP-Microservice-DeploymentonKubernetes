# GCP-Microservice-DeploymentonKubernetes

1. Set up the GCP project 
2. Create the service account in GCP
3. Add the required permissions to the service account
4. Enable the required APIs e.g. Cloud SQL Admin API, Kubernetes Engine API and Google Container Registry API
5. Create the Cloud SQL instance and database and user in GCP with Terraform 
6. Make sure you do not expose sensitive information in the main code and in GitHub - define them in variables
7. Build the microservice using Python flask 
8. Create the Dockerfile for the microservice 
9. Build the Docker image and push it to the Google Container Registry
10. Create the GKE cluster
11. You can store the database user credentials in the Kubernetes secrets
12. Create and deploy the kubernetes manifest files for the microservice(deployment and service)