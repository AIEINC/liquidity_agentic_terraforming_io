import json
from hashlib import sha256
from datetime import datetime

def log_audit(event):
    with open("audit.log", "a") as f:
        entry = {
            "timestamp": datetime.utcnow().isoformat(),
            "event": event,
            "hash": sha256(json.dumps(event).encode()).hexdigest()
        }
        f.write(json.dumps(entry) + "\n")
