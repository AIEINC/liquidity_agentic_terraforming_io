#!/bin/bash
# Auto-generated launcher for Create a google doc
echo "Running agent: Create a google doc"
cat <<EOF
{
  "name": "Create a google doc",
  "flow": [
    {
      "id": 2,
      "module": "gateway:CustomWebHook",
      "version": 1,
      "parameters": {
        "hook": 1916855,
        "maxResults": 1
      },
      "mapper": {},
      "metadata": {
        "designer": {
          "x": -128,
          "y": -5
        },
        "restore": {
          "parameters": {
            "hook": {
              "data": {
                "editable": "true"
              },
              "label": "Google doc (super agent)"
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
      "module": "markdown:Compile",
      "version": 2,
      "parameters": {},
      "mapper": {
        "gfm": true,
        "data": "{{2.Text}}",
        "sanitize": false
      },
      "metadata": {
        "designer": {
          "x": 72,
          "y": -7
        },
        "restore": {
          "expect": {
            "gfm": {
              "mode": "chose"
            },
            "sanitize": {
              "mode": "chose"
            }
          }
        },
        "expect": [
          {
            "name": "data",
            "type": "text",
            "label": "Markdown"
          },
          {
            "name": "gfm",
            "type": "boolean",
            "label": "GitHub Flavored Markdown",
            "required": true
          },
          {
            "name": "sanitize",
            "type": "boolean",
            "label": "Sanitize",
            "required": true
          }
        ]
      }
    },
    {
      "id": 3,
      "module": "google-docs:createADocument",
      "version": 1,
      "parameters": {
        "__IMTCONN__": 2417312
      },
      "mapper": {
        "name": "{{2.Title}}",
        "footer": false,
        "header": false,
        "content": "{{5.data}}",
        "folderId": "/1Aiwp8KNm9Wh5kb-5q3ahXb5Csb8YYlBX",
        "destination": "drive"
      },
      "metadata": {
        "designer": {
          "x": 300,
          "y": 0
        },
        "restore": {
          "expect": {
            "folderId": {
              "mode": "chose",
              "path": [
                "Super Agent"
              ]
            },
            "destination": {
              "label": "My Drive"
            }
          },
          "parameters": {
            "__IMTCONN__": {
              "data": {
                "scoped": "true",
                "connection": "google"
              },
              "label": "My Google connection (oskar@forcefactory-ai.com)"
            }
          }
        },
        "parameters": [
          {
            "name": "__IMTCONN__",
            "type": "account:google",
            "label": "Connection",
            "required": true
          }
        ],
        "expect": [
          {
            "name": "name",
            "type": "text",
            "label": "Name",
            "required": true
          },
          {
            "name": "content",
            "type": "text",
            "label": "Content",
            "required": true
          },
          {
            "name": "destination",
            "type": "select",
            "label": "Choose a Drive",
            "required": true,
            "validate": {
              "enum": [
                "drive",
                "share",
                "team"
              ]
            }
          },
          {
            "name": "header",
            "type": "boolean",
            "label": "Insert a Header",
            "required": true
          },
          {
            "name": "footer",
            "type": "boolean",
            "label": "Insert a Footer",
            "required": true
          },
          {
            "name": "folderId",
            "type": "folder",
            "label": "New Document's Location",
            "required": true
          }
        ]
      }
    },
    {
      "id": 4,
      "module": "gateway:WebhookRespond",
      "version": 1,
      "parameters": {},
      "mapper": {
        "body": "{{3.webViewLink}}",
        "status": "200",
        "headers": []
      },
      "metadata": {
        "designer": {
          "x": 600,
          "y": 0
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
