from gradio_client import Client

class AgenticSupervisor:
    def __init__(self):
        self.client = Client("AIEONE/sgentic-mind-model")

    def call_sgentic_model(self, prompt):
        try:
            result = self.client.predict(prompt, api_name="/predict")
            print("[MODEL RESPONSE]", result)
        except Exception as e:
            print(f"[MODEL CALL FAILED] {e}")

if __name__ == "__main__":
    supervisor = AgenticSupervisor()
    supervisor.call_sgentic_model("Hello from Termux!")
