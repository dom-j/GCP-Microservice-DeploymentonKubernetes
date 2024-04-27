# GCP-Microservice-DeploymentonKubernetes

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

