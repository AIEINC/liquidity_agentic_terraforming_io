from gradio_client import Client

def main():
    client = Client("AIEONE/sgentic-mind-model")
    print("Welcome to the Sgentic CLI Chatbot. Type 'exit' to quit.\n")
    while True:
        user_input = input("You: ")
        if user_input.lower() in ["exit", "quit"]:
            break
        try:
            response = client.predict(user_input, api_name="/predict")
            print("AI:", response)
        except Exception as e:
            print("Error:", e)

if __name__ == "__main__":
    main()
