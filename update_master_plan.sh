#!/data/data/com.termux/files/usr/bin/bash

# Define paths
NEW_CSV="/data/data/com.termux/files/home/storage/downloads/master_plan_v3.2.csv"
PROJECT_DIR="$HOME/agentic-deployment-v5/tables"
TARGET_CSV="$PROJECT_DIR/master_plan_v3.2.csv"
BACKUP_CSV="$PROJECT_DIR/master_plan_v3.2.csv.bak"

# Step 1: Check if new CSV exists
if [ ! -f "$NEW_CSV" ]; then
  echo "ERROR: File not found at $NEW_CSV"
  exit 1
fi

# Step 2: Backup old master plan
if [ -f "$TARGET_CSV" ]; then
  echo "Backing up old master_plan_v3.2.csv..."
  cp "$TARGET_CSV" "$BACKUP_CSV"
fi

# Step 3: Replace file
echo "Replacing with new agentic version..."
cp "$NEW_CSV" "$TARGET_CSV"

# Step 4: Confirm
echo "New master_plan_v3.2.csv preview:"
head -n 3 "$TARGET_CSV"
tail -n 3 "$TARGET_CSV"
echo "Agent count:"
expr $(wc -l < "$TARGET_CSV") - 1
