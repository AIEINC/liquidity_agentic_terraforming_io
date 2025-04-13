import gradio as gr
import pandas as pd

def show_status():
    try:
        df = pd.read_csv("Agentic_Deployment_Master_Plan_v3.2.csv")
        df = df[["Agent_Assigned", "Component", "Risk Score", "Last_Audit_Date"]]
        df.columns = ["Agent", "Component", "Risk", "Last Audit"]
        return df
    except Exception as e:
        return f"Error loading status: {e}"

def show_logs():
    try:
        df = pd.read_csv("agent_logs.csv")
        return df
    except Exception as e:
        return f"Error loading logs: {e}"

with gr.Blocks() as demo:
    gr.Markdown("## Agentic Runtime Dashboard")

    with gr.Tab("Agent Status"):
        gr.Dataframe(show_status, interactive=False, wrap=True)

    with gr.Tab("Agent Log"):
        gr.Dataframe(show_logs, interactive=False, wrap=True)

demo.launch()
