#!/bin/bash
# Auto-generated launcher for Send to Ben (VA)
echo "Running agent: Send to Ben (VA)"
cat <<EOF
{
  "name": "Send to Ben (VA)",
  "flow": [
    {
      "id": 1,
      "module": "gateway:CustomWebHook",
      "version": 1,
      "parameters": {
        "hook": 1945882,
        "maxResults": 1
      },
      "mapper": {},
      "metadata": {
        "designer": {
          "x": 0,
          "y": 0
        },
        "restore": {
          "parameters": {
            "hook": {
              "data": {
                "editable": "true"
              },
              "label": "My gateway-webhook webhook"
            }
          }
        },
        "parameters": [
          {
            "name": "hook",
            "type": "hook:gateway-webhook",
            "label": "Webhook",
            "required": true
          },
          {
            "name": "maxResults",
            "type": "number",
            "label": "Maximum number of results"
          }
        ]
      }
    },
    {
      "id": 2,
      "module": "whatsapp-business-cloud:sendMessage",
      "version": 1,
      "parameters": {
        "__IMTCONN__": 2882568
      },
      "mapper": {
        "to": "5511943305954",
        "text": {
          "body": "{{1.Message}}",
          "preview_url": false
        },
        "type": "text",
        "fromId": "278982118641623"
      },
      "metadata": {
        "designer": {
          "x": 300,
          "y": 0
        },
        "restore": {
          "expect": {
            "text": {
              "nested": {
                "preview_url": {
                  "mode": "chose"
                }
              }
            },
            "type": {
              "label": "Text"
            },
            "fromId": {
              "mode": "chose",
              "label": "Ben Erik Van S Ltda (+55 11 91195-7545)"
            }
          },
          "parameters": {
            "__IMTCONN__": {
              "data": {
                "scoped": "true",
                "connection": "whatsapp-business-cloud2"
              },
              "label": "API 2 (Ben)"
            }
          }
        },
        "parameters": [
          {
            "name": "__IMTCONN__",
            "type": "account:whatsapp-business-cloud2",
            "label": "Connection",
            "required": true
          }
        ],
        "expect": [
          {
            "type": "hidden"
          },
          {
            "name": "fromId",
            "type": "select",
            "label": "Sender ID",
            "required": true
          },
          {
            "name": "to",
            "type": "text",
            "label": "Receiver",
            "required": true
          },
          {
            "name": "type",
            "type": "select",
            "label": "Message Type",
            "required": true,
            "validate": {
              "enum": [
                "text",
                "image",
                "audio",
                "video",
                "document",
                "sticker",
                "location",
                "contacts",
                "interactive"
              ]
            }
          },
          {
            "name": "text",
            "spec": [
              {
                "name": "body",
                "type": "text",
                "label": "Body",
                "required": true,
                "validate": {
                  "max": 4096
                }
              },
              {
                "name": "preview_url",
                "type": "boolean",
                "label": "Preview URL",
                "required": true
              }
            ],
            "type": "collection",
            "label": "Text"
          }
        ]
      }
    },
    {
      "id": 3,
      "module": "gateway:WebhookRespond",
      "version": 1,
      "metadata": {
        "designer": {
          "x": 600,
          "y": 0
        }
      }
    }
  ],
  "metadata": {
    "instant": true,
    "version": 1,
    "scenario": {
      "roundtrips": 1,
      "maxErrors": 3,
      "autoCommit": true,
      "autoCommitTriggerLast": true,
      "sequential": false,
      "slots": null,
      "confidential": false,
      "dataloss": false,
      "dlq": false,
      "freshVariables": false
    },
    "designer": {
      "orphans": []
    },
    "zone": "us1.make.com"
  }
}
EOF
