## Phase Approval Webhook (POST)
Endpoint: `/api/v1/phase-approval`
Request:
```json
{
  "phase_id": "foundation",
  "risk_score": 3.7,
  "agent_justification": "Low historical variance in auth failures"
}
```

## Emergency Override (PUT)
Endpoint: `/api/v1/agents/{id}/isolate`
Headers:
`X-Agentic-Signature: SHA256(secret + timestamp)`
