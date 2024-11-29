# Variables
HELM_CHART_PATH=./helm/demo-app
RELEASE_NAME=my-release
NAMESPACE=default
IMAGE_REPOSITORY=$(ECR_REGISTRY)/$(REPOSITORY)
IMAGE_TAG=$(IMAGE_TAG)
VALUES_FILE=./helm/demo-app/values.yaml

# Ensure you have a kubeconfig to interact with EKS (via AWS CLI)
KUBECONFIG_FILE=kubeconfig

# Targets

# Install or upgrade the Helm chart
deploy:
	@echo "Deploying Helm chart..."
	helm upgrade --install $(RELEASE_NAME) $(HELM_CHART_PATH) \
		--namespace $(NAMESPACE) \
		--set image.repository=$(IMAGE_REPOSITORY) \
		--set image.tag=$(IMAGE_TAG) \
		--values $(VALUES_FILE)

# Update kubeconfig for the EKS cluster
update-kubeconfig:
	@echo "Updating kubeconfig for EKS cluster..."
	aws eks update-kubeconfig --region $(AWS_REGION) --name $(EKS_CLUSTER_NAME) --kubeconfig $(KUBECONFIG_FILE)

# Lint the Helm chart
lint:
	@echo "Linting the Helm chart..."
	helm lint $(HELM_CHART_PATH)

# Install dependencies for the Helm chart (if using any dependencies)
install-deps:
	@echo "Installing chart dependencies..."
	helm dependency update $(HELM_CHART_PATH)

# Clean up any Helm release
uninstall:
	@echo "Uninstalling Helm release..."
	helm uninstall $(RELEASE_NAME) --namespace $(NAMESPACE)

# Show the status of the Helm release
status:
	@echo "Checking status of the Helm release..."
	helm status $(RELEASE_NAME) --namespace $(NAMESPACE)
