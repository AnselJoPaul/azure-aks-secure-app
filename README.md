# Azure AKS Secure App Deployment

This project demonstrates how to securely deploy an application on **Azure Kubernetes Service (AKS)** using **Terraform** and **Kubernetes manifests**. It incorporates best practices for security and infrastructure-as-code, including TLS, RBAC, Ingress, and Network Policies.

---

## 📁 Project Structure

azure-aks-secure-app/  
├── main.tf # Terraform configuration for AKS  
├── variables.tf # Terraform variables  
├── outputs.tf # Terraform outputs  
├── terraform.tfstate # Terraform state  
├── terraform.tfstate.backup# Terraform backup state  
├── app-deployment.yaml # Kubernetes Deployment  
├── app-service.yaml # Kubernetes Service  
├── nginx-ingress.yaml # NGINX Ingress Controller  
├── issuer.yaml # Cert-Manager Issuer  
├── certificate.yaml # TLS Certificate  
├── network-policy.yaml # Network Policies  
├── rbac-role.yaml # RBAC Role  
├── rbac-binding.yaml # RBAC Binding  
├── webpage-ingress.yaml # Ingress for App  

## ✅ Prerequisites

- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [Docker Desktop](https://www.docker.com/products/docker-desktop/) (WSL 2 integration enabled)

---

## ⚙️ Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/AnselJoPaul/azure-aks-secure-app.git
cd azure-aks-secure-app
```
### 2. Provision AKS using Terraform
```bash
terraform init
terraform apply
```
### 3. Configure kubectl
```bash
az aks get-credentials --resource-group rg-aks-secure-app --name aks-secure-cluster
```
### 4. Deploy Kubernetes Resources
```bash
kubectl apply -f app-deployment.yaml
kubectl apply -f app-service.yaml
kubectl apply -f nginx-ingress.yaml
kubectl apply -f issuer.yaml
kubectl apply -f certificate.yaml
kubectl apply -f network-policy.yaml
kubectl apply -f rbac-role.yaml
kubectl apply -f rbac-binding.yaml
kubectl apply -f webpage-ingress.yaml
```
## 🌐 Accessing the Application
The application will be available via the Ingress Controller.
Ensure your DNS is mapped, or access via the public AKS FQDN.

## 🧹 Cleanup
To delete all infrastructure and Kubernetes resources:
```bash
terraform destroy
```
### For optional Docker cleanup (if Docker is installed):
```bash
docker system prune
```
## 📄 License
This project is licensed under the MIT License.
Feel free to fork and adapt it to your needs.

## 🙌 Acknowledgments
Azure AKS Documentation  
Terraform by HashiCorp  
Kubernetes Official Docs  
