import gradio as gr

def respond(prompt):
    # Modify this to actually call your backend or model logic
    return f"Response from sgentic model: {prompt}"

demo = gr.Interface(
    fn=respond,
    inputs=gr.Textbox(lines=2, placeholder="Ask something..."),
    outputs="text",
    title="Sgentic Mind Model",
    description="Talk to your AI assistant."
)

demo.launch()
