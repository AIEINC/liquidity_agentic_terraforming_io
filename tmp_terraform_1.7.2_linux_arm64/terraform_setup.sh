#!/bin/bash

# Ensure we are in the correct directory
echo "Checking current working directory..."
if [ ! -d "deployment/terraform" ]; then
    echo "ERROR: directory 'deployment/terraform' not found. Please make sure you're in the right project directory."
    exit 1
fi

# Navigate to the terraform directory
cd deployment/terraform

# Initialize Terraform (will clear cache and set up provider)
echo "Initializing Terraform..."
terraform init

# Check if initialization was successful
if [ $? -ne 0 ]; then
    echo "ERROR: Terraform initialization failed. Please check your configuration."
    exit 1
fi

# Validate the configuration
echo "Validating Terraform configuration..."
terraform validate

# If validation is successful, apply the configuration
echo "Applying Terraform configuration..."
terraform apply -auto-approve

# Check for any output from the applied resources
if [ $? -eq 0 ]; then
    echo "Terraform configuration applied successfully."
else
    echo "ERROR: Failed to apply Terraform configuration."
    exit 1
fi

# Output the results
echo "Terraform outputs:"
terraform output

echo "Terraform setup complete!"	
