# demo Java application

## prerequisites
1. Create infrastructure using terraform from this repo https://github.com/kashifmehmood-engr/demo-IAC
2. terraform code will create ecr,eks cluster,vpc and all required permission. You can create secret by using those values in step 3
3. Create github secrets to be used in workflow for-example I have created `AWS_ACCOUNT_ID` , `AWS_REGION` , `REPOSITORY` ,`GH_IAM_ROLE` ,`EKS_CLUSTER` ,`ECR_REGISTRY_URL`

## How to run workflow
1. Workflow will run automatically when you push the code to main branch

## How to use makefile
1. Replace $(ECR_REGISTRY), $(REPOSITORY), $(GITHUB_SHA), $(AWS_REGION), and $(EKS_CLUSTER_NAME) with the actual environment variables or secret values you want to use for your environment.
2. Ensure the AWS CLI and Helm are properly installed on your system or CI/CD environment.
3. This `Makefile` contains several targets for deploying and managing Helm charts on your Kubernetes cluster. Below is an overview of each target and how to use it.

| **Target**        | **Description**                                                                                     | **Usage**                                                     |
|-------------------|-----------------------------------------------------------------------------------------------------|---------------------------------------------------------------|
| `deploy`          | Installs or upgrades the Helm chart with the specified settings (e.g., image repository and tag).   | `make deploy`                                                 |
| `update-kubeconfig` | Updates the kubeconfig for your EKS cluster so you can interact with it using `kubectl` and Helm.     | `make update-kubeconfig`                                      |
| `lint`            | Lints the Helm chart to check for potential issues before deployment.                              | `make lint`                                                   |
| `install-deps`    | Installs or updates any chart dependencies defined in `charts/` or the `Chart.yaml` file.           | `make install-deps`                                           |
| `uninstall`       | Uninstalls the Helm release from the Kubernetes cluster.                                            | `make uninstall`                                              |
| `status`          | Displays the status of the Helm release, showing the current state of the deployment.              | `make status`                                                 |

