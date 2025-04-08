#!/bin/bash

# Function to display the contents of main.tf and deploy_from_csv.tf
view_file() {
    local file_path=$1
    if [[ -f "$file_path" ]]; then
        echo "Current contents of $file_path:"
        cat "$file_path"
    else
        echo "$file_path not found."
    fi
}

# Function to allow user to edit the file using nano
edit_file() {
    local file_path=$1
    nano "$file_path"
}

# Function to overwrite main.tf with our version
overwrite_main_tf() {
    echo "Overwriting main.tf with the correct version..."
    cat > main.tf <<EOL
terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_droplet" "agentic_node" {
  name   = "agentic-node"
  region = "nyc1"
  size   = "s-1vcpu-1gb"
  image  = "ubuntu-22-04-x64"
  tags   = ["agentic"]
}

output "droplet_ip" {
  value = digitalocean_droplet.agentic_node.ipv4_address
}
EOL
}

# Function to overwrite deploy_from_csv.tf with the correct version
overwrite_deploy_from_csv_tf() {
    echo "Overwriting deploy_from_csv.tf with the correct version..."
    cat > deploy_from_csv.tf <<EOL
resource "digitalocean_droplet" "agentic_node" {
  name   = "agentic-node"
  region = "nyc1"
  size   = "s-1vcpu-1gb"
  image  = "ubuntu-22-04-x64"
  tags   = ["agentic"]
}
EOL
}

# Function to insert missing variables into main.tf and deploy_from_csv.tf
insert_missing_variables() {
    echo "Checking for missing variables in main.tf and deploy_from_csv.tf..."
    
    # Check if main.tf has the required variables
    if ! grep -q "token = var.do_token" main.tf; then
        echo "Inserting missing 'do_token' variable in main.tf..."
        sed -i '/provider "digitalocean"/a \  token = var.do_token' main.tf
    fi

    # Check if deploy_from_csv.tf has the required variables
    if ! grep -q "resource" deploy_from_csv.tf; then
        echo "Inserting missing resource definition in deploy_from_csv.tf..."
        echo 'resource "digitalocean_droplet" "agentic_node" {' >> deploy_from_csv.tf
        echo '  name   = "agentic-node"' >> deploy_from_csv.tf
        echo '  region = "nyc1"' >> deploy_from_csv.tf
        echo '  size   = "s-1vcpu-1gb"' >> deploy_from_csv.tf
        echo '  image  = "ubuntu-22-04-x64"' >> deploy_from_csv.tf
        echo '  tags   = ["agentic"]' >> deploy_from_csv.tf
        echo '}' >> deploy_from_csv.tf
    fi
}

# Start the script
echo "Checking current contents of main.tf and deploy_from_csv.tf..."

# View contents of main.tf
view_file "main.tf"

# Ask user if they want to edit or overwrite main.tf
echo "Do you want to edit main.tf? (y/n)"
read -r edit_main_tf
if [[ "$edit_main_tf" == "y" ]]; then
    edit_file "main.tf"
else
    echo "Do you want to overwrite main.tf with the correct version? (y/n)"
    read -r overwrite_main_tf
    if [[ "$overwrite_main_tf" == "y" ]]; then
        overwrite_main_tf
    fi
fi

# View contents of deploy_from_csv.tf
view_file "deploy_from_csv.tf"

# Ask user if they want to edit or overwrite deploy_from_csv.tf
echo "Do you want to edit deploy_from_csv.tf? (y/n)"
read -r edit_deploy_from_csv_tf
if [[ "$edit_deploy_from_csv_tf" == "y" ]]; then
    edit_file "deploy_from_csv.tf"
else
    echo "Do you want to overwrite deploy_from_csv.tf with the correct version? (y/n)"
    read -r overwrite_deploy_from_csv_tf
    if [[ "$overwrite_deploy_from_csv_tf" == "y" ]]; then
        overwrite_deploy_from_csv_tf
    fi
fi

# Ask user if they want to insert missing variables
echo "Do you want to insert missing variables into main.tf and deploy_from_csv.tf? (y/n)"
read -r insert_vars
if [[ "$insert_vars" == "y" ]]; then
    insert_missing_variables
fi

echo "Terraform configuration has been updated."
