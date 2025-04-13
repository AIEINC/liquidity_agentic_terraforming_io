from flask import Flask, render_template_string, request, redirect
import pandas as pd
import random
from datetime import datetime
import os

app = Flask(__name__)

CSV_FILE = "Agentic_Deployment_Master_Plan_v3.2.csv"
LOG_FILE = "agent_logs.csv"

if not os.path.exists(LOG_FILE):
    with open(LOG_FILE, "w") as f:
        f.write("Timestamp,Agent,Component,Tool,Objective,Risk Score,Log\n")

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
        self.log = []

    def run_cycle(self):
        result = f"[{datetime.now()}] {self.name} validating '{self.component}' using {self.tool}... OK."
        self.log.append(result)

        risk_delta = random.choice([-1, 0, 1])
        self.risk_score = max(0, self.risk_score + risk_delta)
        self.last_audit = datetime.now().strftime("%Y-%m-%d")

        with open(LOG_FILE, "a") as f:
            f.write(f"{datetime.now()},{self.name},{self.component},{self.tool},{self.objective},{self.risk_score},{result}\n")

        df.loc[self.index, 'Risk Score'] = self.risk_score
        df.loc[self.index, 'Last_Audit_Date'] = self.last_audit

    def status(self):
        return {
            "Agent": self.name,
            "Component": self.component,
            "Risk Score": self.risk_score,
            "Last Audit": self.last_audit,
            "Logs": self.log[-3:]
        }

@app.route('/')
def index():
    return render_template_string('''
    <h1>Agentic Deployment Dashboard</h1>
    <form action="/run" method="post">
        <button type="submit">Run Agent Cycles</button>
    </form>
    <a href="/logs">View Log File</a>
    ''')

@app.route('/run', methods=['POST'])
def run():
    global df
    df = pd.read_csv(CSV_FILE)
    agents = [Agent(row) for _, row in df.iterrows()]

    for _ in range(3):
        for agent in agents:
            agent.run_cycle()

    df.to_csv(CSV_FILE, index=False)

    return redirect('/status')

@app.route('/status')
def status():
    df = pd.read_csv(CSV_FILE)
    rows = df[['Agent_Assigned', 'Component', 'Risk Score', 'Last_Audit_Date']].to_dict(orient='records')
    return render_template_string('''
    <h2>Final Agent Statuses</h2>
    <table border="1">
        <tr><th>Agent</th><th>Component</th><th>Risk</th><th>Last Audit</th></tr>
        {% for r in rows %}
        <tr>
            <td>{{r['Agent_Assigned']}}</td>
            <td>{{r['Component']}}</td>
            <td>{{r['Risk Score']}}</td>
            <td>{{r['Last_Audit_Date']}}</td>
        </tr>
        {% endfor %}
    </table>
    <a href="/">Back</a>
    ''', rows=rows)

@app.route('/logs')
def logs():
    with open(LOG_FILE) as f:
        contents = f.read()
    return f"<h2>Agent Log</h2><pre>{contents}</pre><a href='/'>Back</a>"

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=7860)
