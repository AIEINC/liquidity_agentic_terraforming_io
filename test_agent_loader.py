import json
import os

AGENT_PATH = "tmp_Agentic_Final_Components_v5.0/agents/super_assistant.json"

def load_agent(path):
    if not os.path.exists(path):
        print(f"[ERROR] Agent file not found: {path}")
        return None

    with open(path, "r") as f:
        try:
            data = json.load(f)
            print("[OK] Agent JSON loaded successfully.")
            return data
        except json.JSONDecodeError as e:
            print(f"[ERROR] JSON parsing failed: {e}")
            return None

def print_agent_summary(agent):
    print("\n--- Agent Summary ---")
    print(f"Name: {agent.get('agent_name')}")
    print(f"Role: {agent.get('agent_role')}")
    print(f"Version: {agent.get('engine_version')}")
    print(f"Access Layer: {agent.get('access_layer')}")
    print(f"Priority: {agent.get('priority_level')}")
    print("\nCapabilities:")
    for category in agent.get("capabilities", []):
        print(f"  - {category['category']}")
        for tool in category["tools"]:
            name = tool.get("name")
            functions = ", ".join(tool.get("functions", []))
            print(f"    * {name}: [{functions}]")
    print("\n[COMPLETE] Agent capabilities parsed.")

if __name__ == "__main__":
    agent = load_agent(AGENT_PATH)
    if agent:
        print_agent_summary(agent)
