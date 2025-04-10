from flask import Flask, request, jsonify
from gradio_client import Client

app = Flask(__name__)
client = Client("AIEONE/sgentic-mind-model")

@app.route("/webhook", methods=["POST"])
def webhook():
    data = request.json
    prompt = data.get("prompt", "")
    if not prompt:
        return jsonify({"error": "Missing 'prompt'"}), 400
    try:
        result = client.predict(prompt, api_name="/predict")
        return jsonify({"response": result})
    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
