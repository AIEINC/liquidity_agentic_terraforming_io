import os
import gradio as gr

def respond(prompt):
    user = os.getenv("HF_SPACE_USER", "guest")
    return f"{user} asked: {prompt}"

demo = gr.Interface(
    fn=respond,
    inputs="text",
    outputs="text",
    title="Sgentic Mind Model",
    description="Talk to your agentic model — now with login support."
)

demo.launch()
