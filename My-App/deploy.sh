#!/bin/bash

# Define Variables
ECR_REPO="730335493644.dkr.ecr.ap-south-1.amazonaws.com/my-app"
IMAGE_TAG="latest"
SECRET_NAME="my-registry-key"
DEPLOYMENT_FILE="deployment.yaml"
SECRET_FILE="secret.yaml"

# Build, Tag, and Push Docker Image
docker build -t my-app:1.0 .
docker tag my-app:latest $ECR_REPO:$IMAGE_TAG
docker push $ECR_REPO:$IMAGE_TAG

# Authenticate with AWS ECR
aws ecr get-login-password --region ap-south-1 | docker login -u AWS --password-stdin $ECR_REPO

# Copy .docker/config.json from Minikube
minikube ssh "cat ~/.docker/config.json" > config.json

# Create Kubernetes Secret
kubectl create secret docker-registry $SECRET_NAME \
  --docker-server=$ECR_REPO \
  --docker-username=AWS \
  --docker-password="$(aws ecr get-login-password --region ap-south-1)"

# Deploy Application
kubectl apply -f $SECRET_FILE
kubectl apply -f $DEPLOYMENT_FILE

# Check Deployment Status
kubectl get secrets
kubectl get pods
kubectl get deployments

