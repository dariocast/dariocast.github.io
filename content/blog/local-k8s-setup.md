+++
title = 'Local K8s Setup'
date = 2025-02-05T17:31:20+01:00
Tags = ['devops', 'k8s', 'aws']
Categories = ['tech']
+++

# Configure Kubernetes Locally

- Install kubectl
- Install helm:
  - `brew install helm`
- Install AWS CLI:
```bash
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /
```

At this point, by default, `kubectl` tries to verify the local cluster. This local cluster does not exist unless it has been initialized (*Minikube*, also usable via *Docker Desktop* or *Orbstack*).

## AWS EKS
- Run the command `aws configure`
  - If you do not remember the client ID and secret for AWS:  
    AWS Console -> IAM -> User -> Access Key -> Create Access Key -> Command Line  
  - In the CLI, enter the required values during configuration.
    - Use `eu-central-1` as the region.

- Add clusters via AWS CLI:

```bash
aws eks update-kubeconfig --name <your-cluster-name> --region eu-central-1
```

