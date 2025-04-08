#!/data/data/com.termux/files/usr/bin/bash

# ======================
# ENHANCED INITIALIZATION
# ======================
clear
echo "🛠️  Liquidity Agentic Terraforming Setup"
echo "======================================"

# Improved error handling
fail() {
    echo "❌ Error: $1"
    exit 1
}

# Step 0: Force package updates
pkg update -y && pkg upgrade -y || fail "Package update failed"

# Install critical tools with validation
for pkg in python git openssh curl unzip termux-api wget; do
    pkg install -y "$pkg" || fail "Failed to install $pkg"
done

# ======================
# TERRAFORM INSTALLATION 
# ======================
install_terraform() {
    echo "[*] Installing Terraform..."
    TF_VERSION="1.7.2"
    rm -f terraform_*.zip 2>/dev/null
    
    # Download with 3 retries
    for i in {1..3}; do
        wget "https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_arm64.zip" && break
        sleep 5
    done || fail "Terraform download failed"

    unzip terraform_${TF_VERSION}_linux_arm64.zip || fail "Unzip failed"
    mv terraform $PREFIX/bin/ || fail "Move failed"
    chmod +x $PREFIX/bin/terraform
}

if ! command -v terraform >/dev/null; then
    install_terraform
fi

# ======================
# QR CODE HANDLING
# ======================
show_qr() {
    if command -v qrencode >/dev/null; then
        qrencode -t ANSIUTF8 "$1"
    else
        echo "QR Display: curl -F-=\<- qrenco.de <<< '$1'"
    fi
}

# ======================
# DEPLOYMENT EXECUTION
# ======================
echo -e "\n🚀 Launching Systems..."
echo "---------------------"

# Start Supervisor
[ -f "core/supervisor.py" ] || fail "Missing core/supervisor.py"
nohup python core/supervisor.py > agentic.log 2>&1 &
sleep 3

# Access Methods
echo -e "\n🔗 Access Options:"
echo "----------------"
echo "1. Terminal: curl http://localhost:8080/status"
show_qr "http://localhost:8080"

# Terraform Deployment
if [ -f "deployment/terraform/do_agentic.tf" ]; then
    echo -e "\n🌩️  Initializing Terraform..."
    cd deployment/terraform || fail "Terraform directory missing"
    
    terraform init || fail "Terraform init failed"
    terraform apply -auto-approve || {
        echo "⚠️  Terraform apply failed - check terraform.tfstate"
        exit 1
    }
    
    DASH_URL=$(terraform output -raw dashboard_url 2>/dev/null)
    echo -e "\n✅ Deployment Complete!"
    echo "Dashboard: ${DASH_URL:-'Run \`terraform output\` manually'}"
else
    echo "⚠️  Skipping Terraform (do_agentic.tf not found)"
fi

echo -e "\n💡 Monitoring: tail -f agentic.log"
