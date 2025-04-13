#!/bin/bash
echo "[*] Deploying Liquidity Engine to Deepsite..."
deepsite login --token $DEEPNODE_TOKEN
deepsite push --config .deepsite.yml --project liquidity-agentic
echo "[+] Deployment completed successfully."
