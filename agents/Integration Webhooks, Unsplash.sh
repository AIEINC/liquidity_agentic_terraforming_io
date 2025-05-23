#!/bin/bash
# Auto-generated launcher for Integration Webhooks, Unsplash
echo "Running agent: Integration Webhooks, Unsplash"
cat <<EOF
{
  "name": "Integration Webhooks, Unsplash",
  "flow": [
    {
      "id": 2,
      "module": "gateway:CustomWebHook",
      "version": 1,
      "parameters": {
        "hook": 1896389,
        "maxResults": 1
      },
      "mapper": {},
      "metadata": {
        "designer": {
          "x": -33,
          "y": 1
        },
        "restore": {
          "parameters": {
            "hook": {
              "data": {
                "editable": "true"
              },
              "label": "gg"
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
      "id": 5,
      "module": "unsplash:searchPhotos",
      "version": 1,
      "parameters": {
        "__IMTCONN__": 3677503
      },
      "mapper": {
        "limit": "1",
        "query": "{{2.Query}}",
        "order_by": "relevant",
        "orientation": "landscape",
        "content_filter": "low"
      },
      "metadata": {
        "designer": {
          "x": 359,
          "y": -3
        },
        "restore": {
          "expect": {
            "color": {
              "mode": "chose",
              "label": "Empty"
            },
            "order_by": {
              "mode": "chose",
              "label": "Relevant"
            },
            "orientation": {
              "mode": "chose",
              "label": "Landscape"
            },
            "content_filter": {
              "mode": "chose",
              "label": "Low"
            }
          },
          "parameters": {
            "__IMTCONN__": {
              "data": {
                "scoped": "true",
                "connection": "unsplash"
              },
              "label": "My Unsplash connection (benvansprundel)"
            }
          }
        },
        "parameters": [
          {
            "name": "__IMTCONN__",
            "type": "account:unsplash",
            "label": "Connection",
            "required": true
          }
        ],
        "expect": [
          {
            "name": "query",
            "type": "text",
            "label": "Query",
            "required": true
          },
          {
            "name": "order_by",
            "type": "select",
            "label": "Order By",
            "validate": {
              "enum": [
                "latest",
                "relevant"
              ]
            }
          },
          {
            "name": "collections",
            "type": "text",
            "label": "Collection IDs"
          },
          {
            "name": "orientation",
            "type": "select",
            "label": "Orientation",
            "validate": {
              "enum": [
                "landscape",
                "portrait",
                "squarish"
              ]
            }
          },
          {
            "name": "content_filter",
            "type": "select",
            "label": "Content Filter",
            "validate": {
              "enum": [
                "low",
                "high"
              ]
            }
          },
          {
            "name": "color",
            "type": "select",
            "label": "Color",
            "validate": {
              "enum": [
                "black_and_white",
                "black",
                "white",
                "yellow",
                "orange",
                "red",
                "purple",
                "magenta",
                "green",
                "teal",
                "blue"
              ]
            }
          },
          {
            "name": "limit",
            "type": "uinteger",
            "label": "Limit",
            "validate": {
              "max": 100
            }
          }
        ]
      }
    },
    {
      "id": 6,
      "module": "gateway:WebhookRespond",
      "version": 1,
      "parameters": {},
      "mapper": {
        "body": "{{5.urls.regular}}",
        "status": "200",
        "headers": []
      },
      "metadata": {
        "designer": {
          "x": 726,
          "y": 1
        },
        "restore": {
          "expect": {
            "headers": {
              "mode": "chose"
            }
          }
        },
        "expect": [
          {
            "name": "status",
            "type": "uinteger",
            "label": "Status",
            "required": true,
            "validate": {
              "min": 100
            }
          },
          {
            "name": "body",
            "type": "any",
            "label": "Body"
          },
          {
            "name": "headers",
            "spec": [
              {
                "name": "key",
                "type": "text",
                "label": "Key",
                "required": true,
                "validate": {
                  "max": 256
                }
              },
              {
                "name": "value",
                "type": "text",
                "label": "Value",
                "required": true,
                "validate": {
                  "max": 4096
                }
              }
            ],
            "type": "array",
            "label": "Custom headers",
            "validate": {
              "maxItems": 16
            }
          }
        ]
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
