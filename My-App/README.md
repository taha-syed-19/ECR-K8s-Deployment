# ECR Minikube Authentication & Deployment

## Overview
This repository provides a step-by-step guide to building, pushing, and deploying a Node.js application from a private AWS Elastic Container Registry (ECR) to a Minikube Kubernetes cluster. It includes a shell script (`deploy.sh`) to automate the process.

## Prerequisites
Ensure you have the following installed and configured:
- **AWS CLI** (configured with access to ECR)
- **Docker**
- **Minikube**
- **Kubectl**

## Getting Started
### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/ecr-minikube-auth-deploy.git
cd ecr-minikube-auth-deploy
```

### 2. Make the Script Executable
```bash
chmod +x deploy.sh
```

### 3. Run the Deployment Script
```bash
./deploy.sh
```

## How It Works
1. **Build and Push Docker Image**
   - The script builds the Docker image and tags it with the latest version.
   - The image is pushed to AWS ECR.

2. **Authenticate with AWS ECR**
   - The script fetches ECR credentials and logs in using `docker login`.
   - It retrieves `.docker/config.json` from Minikube.

3. **Create Kubernetes Secret**
   - The script creates a secret in Kubernetes using the ECR credentials.

4. **Deploy the Application**
   - Kubernetes applies the `deployment.yaml` and `secret.yaml` files.

## Useful Commands
Check the status of deployments and pods:
```bash
kubectl get secrets
kubectl get pods
kubectl get deployments
```

## Notes
- Ensure you replace `730335493644.dkr.ecr.ap-south-1.amazonaws.com/my-app` with your actual AWS ECR repository.
- Modify `deployment.yaml` and `secret.yaml` as needed for your application.

## Troubleshooting
If the script fails, try the following:
- Verify AWS CLI credentials: `aws sts get-caller-identity`
- Check if Minikube is running: `minikube status`
- Ensure the correct region is set in AWS commands.

## License
This project is open-source and free to use.

