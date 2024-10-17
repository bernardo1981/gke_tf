mkdir -p Kubernetes_Project/modules/gke
cd Kubernetes_Project/modules/gke
vim main.tf
terraform init
terraform apply
#Outputs:
#gke_cluster_master_version = 1.11.6-gke.6