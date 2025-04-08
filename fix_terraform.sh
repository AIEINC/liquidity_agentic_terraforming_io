#!/bin/bash
# Fix CSV paths and clean environment

# Set canonical CSV location
CANONICAL_CSV="tables/master_plan_v3.2.csv"

# Verify CSV exists
if [ ! -f "$CANONICAL_CSV" ]; then
  echo "Error: Canonical CSV missing! Check tables directory."
  exit 1
fi

# Create root symlink
ln -sf "$CANONICAL_CSV" master_plan_v3.2.csv

# Update Terraform config
sed -i.bak 's|file(".*master_plan.*")|file("${path.module}/master_plan_v3.2.csv")|g' deploy_from_csv.tf

# Clean temporary files
rm -rf tmp_* *.zip.*

echo "Path standardization complete. Run 'terraform plan' to verify."
