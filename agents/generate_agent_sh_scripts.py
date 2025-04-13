#!/usr/bin/env python3
import json
from pathlib import Path

AGENTS_DIR = Path(__file__).parent / "functions"
OUTPUT_DIR = Path(__file__).parent

json_files = AGENTS_DIR.glob("*.json")

for json_file in json_files:
    with open(json_file) as f:
        config = json.load(f)

    agent_name = config.get("name", json_file.stem)
    script_path = OUTPUT_DIR / f"{agent_name}.sh"

    run_command = config.get("run_command")
    if not run_command:
        run_command = f'echo "Running agent: {agent_name}"\ncat <<EOF\n{json.dumps(config, indent=2)}\nEOF'

    with open(script_path, "w") as sh:
        sh.write("#!/bin/bash\n")
        sh.write(f"# Auto-generated launcher for {agent_name}\n")
        sh.write(run_command + "\n")

    script_path.chmod(0o755)

print("Shell scripts generated for all agent JSONs.")
