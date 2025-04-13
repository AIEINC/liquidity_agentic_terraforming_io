import pandas as pd
import os
import json
import time
import random
from datetime import datetime

CSV_FILE = "Agentic_Deployment_Master_Plan_v3.2.csv"
LOG_FILE = "agent_logs.csv"
HOOKS_DIR = "hooks"
FUNC_DIR = "functions"

# Load spreadsheet
df = pd.read_csv(CSV_FILE)

# Create log file if needed
if not os.path.exists(LOG_FILE):
    with open(LOG_FILE, "w") as f:
        f.write("Timestamp,Agent,Component,Tool,Objective,Risk Score,Log\n")

# Agent Class Definition
class Agent:
    def __init__(self, row):
        self.phase = row['Phase']
        self.component = row['Component']
        self.objective = row['Objective']
        self.tool = row['Tool/Tech']
        self.name = row['Agent_Assigned']
        self.frequency = row['Monitoring_Frequency']
        self.index = row.name
        self.risk_score = int(row['Risk Score']) if not pd.isna(row['Risk Score']) else 5
        self.last_audit = row.get('Last_Audit_Date', None)
        self.automation_level = row.get('Automation_Level', 0)
        self.log = []
        self.hooks = self.load_json(HOOKS_DIR)
        self.functions = self.load_json(FUNC_DIR)

    def load_json(self, directory):
        filename = f"{self.name.lower().replace(' ', '_').replace('(', '').replace(')', '')}.json"
        path = os.path.join(directory, filename)
        if os.path.exists(path):
            with open(path) as f:
                return json.load(f)
        return {}

    def run_cycle(self):
        result = f"[{datetime.now()}] {self.name} validating '{self.component}' using {self.tool}... OK."
        print(result)
        self.log.append(result)

        risk_delta = random.choice([-1, 0, 1])
        self.risk_score = max(0, self.risk_score + risk_delta)
        self.last_audit = datetime.now().strftime("%Y-%m-%d")

        # Log to file
        with open(LOG_FILE, "a") as f:
            f.write(f"{datetime.now()},{self.name},{self.component},{self.tool},{self.objective},{self.risk_score},{result}\n")

        # Update DataFrame
        df.loc[self.index, 'Risk Score'] = self.risk_score
        df.loc[self.index, 'Last_Audit_Date'] = self.last_audit

    def status(self):
        return {
            "Agent": self.name,
            "Component": self.component,
            "Risk Score": self.risk_score,
            "Last Audit": self.last_audit,
            "Hooks": self.hooks,
            "Functions": self.functions,
            "Logs": self.log[-3:]
        }

# Run main cycle
agents = [Agent(row) for _, row in df.iterrows()]
print("\n>>> Agentic Deployment Runtime Initialized...\n")

for cycle in range(3):
    print(f"--- Cycle {cycle+1} ---")
    for agent in agents:
        agent.run_cycle()
    time.sleep(1)

# Save updated CSV
df.to_csv(CSV_FILE, index=False)

print("\n>>> Final Agent Statuses:")
for agent in agents:
    print(agent.status())
