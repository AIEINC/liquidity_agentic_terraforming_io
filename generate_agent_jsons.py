import pandas as pd
import os
import json

df = pd.read_csv("Agentic_Deployment_Master_Plan_v3.2.csv")

HOOKS_DIR = "hooks"
FUNC_DIR = "functions"

os.makedirs(HOOKS_DIR, exist_ok=True)
os.makedirs(FUNC_DIR, exist_ok=True)

for _, row in df.iterrows():
    name = row["Agent_Assigned"].lower().replace(" ", "_").replace("(", "").replace(")", "")
    
    hooks_path = os.path.join(HOOKS_DIR, f"{name}.json")
    func_path = os.path.join(FUNC_DIR, f"{name}.json")

    if not os.path.exists(hooks_path):
        with open(hooks_path, "w") as f:
            json.dump({
                "integration_variables": {
                    "env_binding": "default",
                    "data_share": True,
                    "authorized_endpoints": []
                }
            }, f, indent=2)

    if not os.path.exists(func_path):
        with open(func_path, "w") as f:
            json.dump({
                "security_protocols": {
                    "encryption": "AES-256",
                    "auth_level": "OAuth2",
                    "containment": "sandboxed"
                },
                "validation_rules": {
                    "frequency_limit": row.get("Monitoring_Frequency", "daily"),
                    "risk_threshold": row.get("Risk Score", 5)
                }
            }, f, indent=2)

print("JSONs generated for all agents.")
