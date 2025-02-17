# MongoDB Helm Deployment

This repository provides a streamlined process for deploying MongoDB using Helm with a custom `values.yaml` file. The installation is based on the Bitnami MongoDB Helm chart, ensuring a reliable and production-ready setup.

## Prerequisites

Before proceeding, ensure you have the following installed:
- Kubernetes cluster (configured and running)
- Helm (package manager for Kubernetes)
- A configured `values.yaml` file for custom MongoDB settings

## Adding the Bitnami Helm Repository

To install MongoDB using Helm, first add the Bitnami Helm repository:

```sh
helm repo add bitnami https://charts.bitnami.com/bitnami
```

## Searching for the MongoDB Helm Chart

To verify the MongoDB chart is available in the repository, search for it using:

```sh
helm search repo bitnami
```

This will return a list of available Bitnami charts, including MongoDB.

## Installing MongoDB with Helm

Once the repository is added and verified, install MongoDB using the pre-configured `values.yaml` file:

```sh
helm install mongodb --values mongodb-values.yaml bitnami/mongodb
```

This command deploys MongoDB with the settings defined in `mongodb-values.yaml`.

## Verifying Installation

Check if the MongoDB deployment is running:

```sh
kubectl get pods
```

## Uninstalling MongoDB

To remove the MongoDB deployment, run:

```sh
helm uninstall mongodb
```

## Notes

- Ensure that `mongodb-values.yaml` contains the appropriate configuration for your environment.
- If needed, update the Helm repository before installing:
  
  ```sh
  helm repo update
  ```

For additional configurations, refer to the official Bitnami MongoDB Helm chart documentation: [Bitnami MongoDB Helm Chart](https://bitnami.com/stack/mongodb/helm).

---



