import gradio as gr
from gradio_client import Client

# Connect to your deployed Hugging Face model
client = Client("AIEONE/sgentic-mind-model")

def respond(prompt):
    try:
        # Send prompt to your actual model (this is where the AI lives)
        result = client.predict(prompt, api_name="/predict")
        return result
    except Exception as e:
        return f"[Error calling model] {e}"

# Create the UI
demo = gr.Interface(
    fn=respond,
    inputs=gr.Textbox(lines=2, placeholder="Ask something..."),
    outputs="text",
    title="Sgentic Mind Model",
    description="Interact with the live Hugging Face AI model"
)

# Launch the app in Hugging Face Spaces
demo.launch()
