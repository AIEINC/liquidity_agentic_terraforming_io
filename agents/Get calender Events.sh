#!/bin/bash
# Auto-generated launcher for Get calender Events
echo "Running agent: Get calender Events"
cat <<EOF
{
  "name": "Get calender Events",
  "flow": [
    {
      "id": 1,
      "module": "gateway:CustomWebHook",
      "version": 1,
      "parameters": {
        "hook": 1690265,
        "maxResults": 1
      },
      "mapper": {},
      "metadata": {
        "designer": {
          "x": -568,
          "y": -1
        },
        "restore": {
          "parameters": {
            "hook": {
              "data": {
                "editable": "true"
              },
              "label": "Get Calender"
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
      "id": 7,
      "module": "builtin:BasicRouter",
      "version": 1,
      "mapper": null,
      "metadata": {
        "designer": {
          "x": -227,
          "y": -1
        }
      },
      "routes": [
        {
          "flow": [
            {
              "id": 2,
              "module": "google-calendar:searchEvents",
              "version": 5,
              "parameters": {
                "__IMTCONN__": 3247930
              },
              "filter": {
                "name": "All events",
                "conditions": [
                  [
                    {
                      "a": "{{1.email}}",
                      "b": "undefined",
                      "o": "text:equal"
                    }
                  ]
                ]
              },
              "mapper": {
                "limit": "20",
                "orderBy": "startTime",
                "timeMax": "{{1.`End date`}}",
                "timeMin": "{{1.`Start Date`}}",
                "calendar": "ben@forcefactory-ai.com",
                "eventTypes": [
                  "default",
                  "fromGmail",
                  "focusTime",
                  "outOfOffice",
                  "workingLocation"
                ],
                "singleEvents": true
              },
              "metadata": {
                "designer": {
                  "x": 204,
                  "y": -105
                },
                "restore": {
                  "expect": {
                    "orderBy": {
                      "mode": "chose",
                      "label": "Start Time (ascending)"
                    },
                    "calendar": {
                      "mode": "chose",
                      "label": "ben@forcefactory-ai.com (Primary Calendar)"
                    },
                    "eventTypes": {
                      "mode": "chose"
                    }
                  },
                  "parameters": {
                    "__IMTCONN__": {
                      "data": {
                        "scoped": "true",
                        "connection": "google"
                      },
                      "label": "My Google connection (ben@forcefactory-ai.com)"
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
                    "name": "calendar",
                    "type": "select",
                    "label": "Calendar ID",
                    "required": true
                  },
                  {
                    "name": "timeMin",
                    "time": true,
                    "type": "date",
                    "label": "Start Date"
                  },
                  {
                    "name": "timeMax",
                    "time": true,
                    "type": "date",
                    "label": "End Date"
                  },
                  {
                    "name": "updatedMin",
                    "time": true,
                    "type": "date",
                    "label": "Updated from"
                  },
                  {
                    "name": "singleEvents",
                    "type": "boolean",
                    "label": "Single Events",
                    "required": true
                  },
                  {
                    "name": "q",
                    "type": "text",
                    "label": "Query"
                  },
                  {
                    "name": "eventTypes",
                    "type": "select",
                    "label": "Event Types",
                    "multiple": true,
                    "validate": {
                      "enum": [
                        "default",
                        "fromGmail",
                        "focusTime",
                        "outOfOffice",
                        "workingLocation"
                      ]
                    }
                  },
                  {
                    "name": "orderBy",
                    "type": "select",
                    "label": "Order By",
                    "validate": {
                      "enum": [
                        "startTime",
                        "updated"
                      ]
                    }
                  },
                  {
                    "name": "limit",
                    "type": "uinteger",
                    "label": "Limit"
                  }
                ]
              }
            },
            {
              "id": 4,
              "module": "builtin:BasicAggregator",
              "version": 1,
              "parameters": {
                "feeder": 2
              },
              "mapper": {
                "end": "{{2.end}}",
                "start": "{{2.start}}",
                "summary": "{{2.summary}}",
                "attendees": "{{2.attendees}}",
                "description": "{{2.description}}",
                "hangoutLink": "{{2.hangoutLink}}"
              },
              "metadata": {
                "designer": {
                  "x": 552,
                  "y": -100
                },
                "restore": {
                  "extra": {
                    "feeder": {
                      "label": "Google Calendar - Search Events [2]"
                    },
                    "target": {
                      "label": "Custom"
                    }
                  }
                }
              }
            },
            {
              "id": 3,
              "module": "gateway:WebhookRespond",
              "version": 1,
              "parameters": {},
              "mapper": {
                "body": "{{4.array}}",
                "status": "200",
                "headers": []
              },
              "metadata": {
                "designer": {
                  "x": 826,
                  "y": -99
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
          ]
        },
        {
          "flow": [
            {
              "id": 5,
              "module": "google-calendar:searchEvents",
              "version": 5,
              "parameters": {
                "__IMTCONN__": 3247930
              },
              "filter": {
                "name": "email",
                "conditions": [
                  [
                    {
                      "a": "{{1.email}}",
                      "b": "@",
                      "o": "text:contain"
                    }
                  ]
                ]
              },
              "mapper": {
                "q": "{{1.email}}",
                "limit": "20",
                "timeMax": "{{1.`End date`}}",
                "timeMin": "{{1.`Start Date`}}",
                "calendar": "ben@forcefactory-ai.com",
                "singleEvents": false
              },
              "metadata": {
                "designer": {
                  "x": 206,
                  "y": 159
                },
                "restore": {
                  "expect": {
                    "orderBy": {
                      "mode": "chose",
                      "label": "Empty"
                    },
                    "calendar": {
                      "mode": "chose",
                      "label": "ben@forcefactory-ai.com (Primary Calendar)"
                    },
                    "eventTypes": {
                      "mode": "chose"
                    }
                  },
                  "parameters": {
                    "__IMTCONN__": {
                      "data": {
                        "scoped": "true",
                        "connection": "google"
                      },
                      "label": "My Google connection (ben@forcefactory-ai.com)"
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
                    "name": "calendar",
                    "type": "select",
                    "label": "Calendar ID",
                    "required": true
                  },
                  {
                    "name": "timeMin",
                    "time": true,
                    "type": "date",
                    "label": "Start Date"
                  },
                  {
                    "name": "timeMax",
                    "time": true,
                    "type": "date",
                    "label": "End Date"
                  },
                  {
                    "name": "updatedMin",
                    "time": true,
                    "type": "date",
                    "label": "Updated from"
                  },
                  {
                    "name": "singleEvents",
                    "type": "boolean",
                    "label": "Single Events",
                    "required": true
                  },
                  {
                    "name": "q",
                    "type": "text",
                    "label": "Query"
                  },
                  {
                    "name": "eventTypes",
                    "type": "select",
                    "label": "Event Types",
                    "multiple": true,
                    "validate": {
                      "enum": [
                        "default",
                        "fromGmail",
                        "focusTime",
                        "outOfOffice",
                        "workingLocation"
                      ]
                    }
                  },
                  {
                    "name": "orderBy",
                    "type": "select",
                    "label": "Order By",
                    "validate": {
                      "enum": [
                        "startTime",
                        "updated"
                      ]
                    }
                  },
                  {
                    "name": "limit",
                    "type": "uinteger",
                    "label": "Limit"
                  }
                ]
              }
            },
            {
              "id": 8,
              "module": "builtin:BasicAggregator",
              "version": 1,
              "parameters": {
                "feeder": 5
              },
              "mapper": {
                "end": "{{5.end}}",
                "start": "{{5.start}}",
                "summary": "{{5.summary}}",
                "attendees": "{{5.attendees}}",
                "description": "{{5.description}}",
                "hangoutLink": "{{5.hangoutLink}}"
              },
              "metadata": {
                "designer": {
                  "x": 556,
                  "y": 156
                },
                "restore": {
                  "extra": {
                    "feeder": {
                      "label": "Google Calendar - Search Events [5]"
                    },
                    "target": {
                      "label": "Custom"
                    }
                  }
                }
              }
            },
            {
              "id": 9,
              "module": "gateway:WebhookRespond",
              "version": 1,
              "parameters": {},
              "mapper": {
                "body": "{{8.array}}",
                "status": "200",
                "headers": []
              },
              "metadata": {
                "designer": {
                  "x": 844,
                  "y": 159
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
          ]
        }
      ]
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
