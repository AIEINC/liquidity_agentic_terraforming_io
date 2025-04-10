import gradio as gr

def respond(prompt):
    return f"Hello! You said: {prompt}"

demo = gr.Interface(
    fn=respond,
    inputs=gr.Textbox(lines=2, placeholder="Enter your message..."),
    outputs="text",
    title="Sgentic Mind Model",
    description="Simple model interface"
)

demo.launch()
