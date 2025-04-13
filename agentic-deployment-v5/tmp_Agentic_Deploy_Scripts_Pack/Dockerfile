FROM python:3.11-slim as builder

WORKDIR /app
COPY requirements.txt .
RUN pip install --user -r requirements.txt

FROM python:3.11-slim
WORKDIR /app
COPY --from=builder /root/.local /root/.local
COPY supervisor.py agentic.py /app/
COPY /agents /app/agents

RUN chmod +x /app/agents/*.sh
ENV PATH=/root/.local/bin:$PATH
CMD ["python", "supervisor.py"]
