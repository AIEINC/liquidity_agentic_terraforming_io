import yaml
import requests
import os

class AgenticSupervisor:
    def __init__(self, config_path='config.yaml'):
        self.config = self._load_config(config_path)

    def _load_config(self, config_path):
        try:
            with open(config_path, 'r') as file:
                return yaml.safe_load(file)
        except Exception as e:
            print(f"[CRITICAL] Failed to load config: {e}")
            return {}

    def _alert(self, message, critical=False):
        if 'alerts' in self.config and 'pagerduty' in self.config['alerts']:
            try:
                requests.post(self.config['alerts']['pagerduty'], json={
                    "message": message,
                    "critical": critical
                })
            except Exception as e:
                print(f"[ALERT FAILED] {e}")

# Example usage
if __name__ == "__main__":
    supervisor = AgenticSupervisor()
    print("Loaded config:", supervisor.config)
