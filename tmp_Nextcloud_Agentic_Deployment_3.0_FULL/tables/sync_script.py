#!/usr/bin/env python3
import pandas as pd
import hashlib
from webdav3.client import Client
from datetime import datetime

# Nextcloud WebDAV config
WEBDAV_CONFIG = {
    'webdav_hostname': "https://your-nextcloud.com/remote.php/dav/files/USERNAME/",
    'webdav_login': "username",
    'webdav_password': "password",
    'webdav_root': "/agentic_deployment/tables/"
}

def calculate_diff(current_df, new_df):
    """Identify added/modified rows using MD5 hashes of row data"""
    current_df['hash'] = current_df.apply(lambda x: hashlib.md5(x.to_string().encode()).hexdigest(), axis=1)
    new_df['hash'] = new_df.apply(lambda x: hashlib.md5(x.to_string().encode()).hexdigest(), axis=1)
    
    merged = pd.merge(current_df, new_df, on='hash', how='outer', indicator=True)
    changes = merged[merged['_merge'] != 'both']
    return changes

def sync_with_nextcloud():
    client = Client(WEBDAV_CONFIG)
    local_path = "master_plan_v3.2.csv"
    remote_path = "master_plan_v3.2.csv"
    
    # Download current version
    client.download_file(remote_path, local_path)
    current_df = pd.read_csv(local_path)
    
    # Get new edits (simulated - in practice would watch filesystem/API)
    new_df = pd.read_csv("local_edits.csv")  
    
    # Calculate & apply changes
    diff = calculate_diff(current_df, new_df)
    if not diff.empty:
        updated_df = pd.concat([current_df, diff], ignore_index=True).drop_duplicates(subset='hash', keep='last')
        updated_df.to_csv(local_path, index=False)
        client.upload_file(local_path, remote_path)
        log_change(diff.shape[0])
    return diff.shape[0]

def log_change(num_updates):
    with open("sync_log.txt", "a") as f:
        f.write(f"{datetime.now()}: Synced {num_updates} changes\n")

if __name__ == "__main__":
    changes_made = sync_with_nextcloud()
    print(f"Sync complete. {changes_made} rows updated.")
