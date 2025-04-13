#!/bin/bash
# Auto-generated launcher for Update to do list
echo "Running agent: Update to do list"
cat <<EOF
{
  "name": "Update to do list",
  "flow": [
    {
      "id": 1,
      "module": "gateway:CustomWebHook",
      "version": 1,
      "parameters": {
        "hook": 1695294,
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
              "label": "Notion to do"
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
      "module": "notion:createAPage",
      "version": 1,
      "parameters": {
        "__IMTCONN__": 2882389
      },
      "mapper": {
        "fields": {
          "title": "{{1.Task}}",
          "U%7CNl": "{{1.Priority}}"
        },
        "select": "list",
        "database": "97fef15e70f845439002add3d0e0f797"
      },
      "metadata": {
        "designer": {
          "x": 300,
          "y": 0
        },
        "restore": {
          "expect": {
            "fields": {
              "nested": {
                "Ybdp": {
                  "mode": "chose",
                  "label": "Empty"
                },
                "vQXU": {
                  "mode": "chose"
                },
                "U%7CNl": {
                  "mode": "edit"
                },
                "%3D%7Ch%60": {
                  "mode": "chose",
                  "label": "Empty"
                }
              }
            },
            "select": {
              "label": "Select from the list"
            },
            "database": {
              "nested": [
                {
                  "name": "fields",
                  "spec": [
                    {
                      "name": "title",
                      "type": "text",
                      "label": "Name",
                      "metadata": {
                        "type": "title"
                      },
                      "required": true
                    },
                    {
                      "name": "%3D%7Ch%60",
                      "type": "select",
                      "label": "Category",
                      "options": [
                        {
                          "label": "Youtube",
                          "value": "Youtube"
                        },
                        {
                          "label": "Tool Building",
                          "value": "Tool Building"
                        },
                        {
                          "label": "FF Outbound",
                          "value": "FF Outbound"
                        },
                        {
                          "label": "Inbound",
                          "value": "Inbound"
                        },
                        {
                          "label": "noCRM",
                          "value": "noCRM"
                        },
                        {
                          "label": "personal",
                          "value": "personal"
                        }
                      ],
                      "metadata": {
                        "type": "select"
                      },
                      "validate": false
                    },
                    {
                      "name": "U%7CNl",
                      "type": "select",
                      "label": "Priority",
                      "options": [
                        {
                          "label": "Low",
                          "value": "Low"
                        },
                        {
                          "label": "Medium",
                          "value": "Medium"
                        },
                        {
                          "label": "High",
                          "value": "High"
                        }
                      ],
                      "metadata": {
                        "type": "select"
                      },
                      "validate": false
                    },
                    {
                      "name": "Ybdp",
                      "type": "select",
                      "label": "Status",
                      "grouped": true,
                      "options": [
                        {
                          "label": "To-do",
                          "options": [
                            {
                              "label": "This week",
                              "value": "This week"
                            },
                            {
                              "label": "Not started",
                              "value": "Not started"
                            }
                          ]
                        },
                        {
                          "label": "In progress",
                          "options": [
                            {
                              "label": "In progress",
                              "value": "In progress"
                            }
                          ]
                        },
                        {
                          "label": "Complete",
                          "options": [
                            {
                              "label": "Done",
                              "value": "Done"
                            }
                          ]
                        }
                      ],
                      "metadata": {
                        "type": "status"
                      }
                    },
                    {
                      "name": "vQXU",
                      "type": "select",
                      "label": "Assign",
                      "options": "rpc://notion/1/listUsers?noBot=true",
                      "metadata": {
                        "type": "people"
                      },
                      "multiple": true
                    }
                  ],
                  "type": "collection",
                  "label": "Fields"
                }
              ]
            }
          },
          "parameters": {
            "__IMTCONN__": {
              "data": {
                "scoped": "true",
                "connection": "notion3"
              },
              "label": "Forcefactory"
            }
          }
        },
        "parameters": [
          {
            "name": "__IMTCONN__",
            "type": "account:notion2,notion3",
            "label": "Connection",
            "required": true
          }
        ],
        "expect": [
          {
            "name": "select",
            "type": "select",
            "label": "Enter a Database ID",
            "required": true,
            "validate": {
              "enum": [
                "map",
                "list"
              ]
            }
          },
          {
            "name": "database",
            "type": "text",
            "label": "Database ID",
            "required": true
          },
          {
            "name": "fields",
            "spec": [
              {
                "name": "title",
                "type": "text",
                "label": "Name",
                "metadata": {
                  "type": "title"
                },
                "required": true
              },
              {
                "name": "%3D%7Ch%60",
                "type": "select",
                "label": "Category",
                "metadata": {
                  "type": "select"
                }
              },
              {
                "name": "U%7CNl",
                "type": "select",
                "label": "Priority",
                "metadata": {
                  "type": "select"
                }
              },
              {
                "name": "Ybdp",
                "type": "select",
                "label": "Status",
                "metadata": {
                  "type": "status"
                },
                "validate": {
                  "enum": [
                    "This week",
                    "Not started",
                    "In progress",
                    "Done"
                  ]
                }
              },
              {
                "name": "vQXU",
                "type": "select",
                "label": "Assign",
                "metadata": {
                  "type": "people"
                },
                "multiple": true
              }
            ],
            "type": "collection",
            "label": "Fields"
          }
        ],
        "interface": [
          {
            "name": "object",
            "type": "text",
            "label": "Object"
          },
          {
            "name": "id",
            "type": "text",
            "label": "Database Item ID"
          },
          {
            "name": "created_time",
            "type": "date",
            "label": "Created Time"
          },
          {
            "name": "last_edited_time",
            "type": "date",
            "label": "Last Edited Time"
          },
          {
            "name": "created_by",
            "spec": [
              {
                "name": "object",
                "type": "text",
                "label": "Object"
              },
              {
                "name": "id",
                "type": "uuid",
                "label": "ID"
              }
            ],
            "type": "collection",
            "label": "Created by"
          },
          {
            "name": "last_edited_by",
            "spec": [
              {
                "name": "object",
                "type": "text",
                "label": "Object"
              },
              {
                "name": "id",
                "type": "uuid",
                "label": "ID"
              }
            ],
            "type": "collection",
            "label": "Last Edited by"
          },
          {
            "name": "icon",
            "spec": [
              {
                "name": "type",
                "type": "text",
                "label": "Type"
              },
              {
                "name": "emoji",
                "type": "text",
                "label": "Emoji"
              }
            ],
            "type": "collection",
            "label": "Icon"
          },
          {
            "name": "cover",
            "spec": [
              {
                "name": "type",
                "type": "text",
                "label": "Type"
              },
              {
                "name": "external",
                "spec": [
                  {
                    "name": "url",
                    "type": "text",
                    "label": "URL"
                  }
                ],
                "type": "collection",
                "label": "External"
              }
            ],
            "type": "collection",
            "label": "Cover"
          },
          {
            "name": "url",
            "type": "text",
            "label": "URL"
          },
          {
            "name": "parent",
            "spec": [
              {
                "name": "type",
                "type": "text",
                "label": "Type"
              },
              {
                "name": "workspace",
                "type": "boolean",
                "label": "Workspace"
              },
              {
                "name": "page_id",
                "type": "text",
                "label": "Page ID"
              },
              {
                "name": "database_id",
                "type": "text",
                "label": "Database ID"
              }
            ],
            "type": "collection",
            "label": "Parent"
          },
          {
            "name": "archived",
            "type": "boolean",
            "label": "Archived"
          },
          {
            "name": "properties",
            "spec": {
              "spec": [
                {
                  "name": "id",
                  "type": "text",
                  "label": "ID"
                },
                {
                  "name": "type",
                  "type": "text",
                  "label": "Type"
                },
                {
                  "name": "people",
                  "spec": {
                    "spec": [
                      {
                        "name": "object",
                        "type": "text",
                        "label": "Object"
                      },
                      {
                        "name": "id",
                        "type": "text",
                        "label": "ID"
                      },
                      {
                        "name": "name",
                        "type": "text",
                        "label": "Name"
                      },
                      {
                        "name": "avatar_url",
                        "type": "text",
                        "label": "Avatar Url"
                      },
                      {
                        "name": "type",
                        "type": "text",
                        "label": "Type"
                      },
                      {
                        "name": "person",
                        "spec": [
                          {
                            "name": "email",
                            "type": "text",
                            "label": "Email"
                          }
                        ],
                        "type": "collection",
                        "label": "Person"
                      }
                    ],
                    "type": "collection"
                  },
                  "type": "array",
                  "label": "People"
                },
                {
                  "name": "url",
                  "type": "text",
                  "label": "URL"
                },
                {
                  "name": "text",
                  "spec": {
                    "spec": [
                      {
                        "name": "type",
                        "type": "text",
                        "label": "Type"
                      },
                      {
                        "name": "text",
                        "spec": [
                          {
                            "name": "content",
                            "type": "text",
                            "label": "Content"
                          },
                          {
                            "name": "link",
                            "type": "text",
                            "label": "Link"
                          }
                        ],
                        "type": "collection",
                        "label": "Text"
                      },
                      {
                        "name": "annotations",
                        "spec": [
                          {
                            "name": "bold",
                            "type": "boolean",
                            "label": "Bold"
                          },
                          {
                            "name": "italic",
                            "type": "boolean",
                            "label": "Italic"
                          },
                          {
                            "name": "strikethrough",
                            "type": "boolean",
                            "label": "Strikethrough"
                          },
                          {
                            "name": "underline",
                            "type": "boolean",
                            "label": "Underline"
                          },
                          {
                            "name": "code",
                            "type": "boolean",
                            "label": "Code"
                          },
                          {
                            "name": "color",
                            "type": "text",
                            "label": "Color"
                          }
                        ],
                        "type": "collection",
                        "label": "Annotations"
                      },
                      {
                        "name": "plain_text",
                        "type": "text",
                        "label": "Plain Text"
                      },
                      {
                        "name": "href",
                        "type": "text",
                        "label": "Href"
                      }
                    ],
                    "type": "collection"
                  },
                  "type": "array",
                  "label": "Text"
                },
                {
                  "name": "select",
                  "spec": [
                    {
                      "name": "id",
                      "type": "text",
                      "label": "ID"
                    },
                    {
                      "name": "name",
                      "type": "text",
                      "label": "Name"
                    },
                    {
                      "name": "color",
                      "type": "text",
                      "label": "Color"
                    }
                  ],
                  "type": "collection",
                  "label": "Select"
                },
                {
                  "name": "email",
                  "type": "text",
                  "label": "Email"
                },
                {
                  "name": "phone_number",
                  "type": "text",
                  "label": "Phone Number"
                },
                {
                  "name": "multi_select",
                  "spec": {
                    "spec": [
                      {
                        "name": "id",
                        "type": "text",
                        "label": "ID"
                      },
                      {
                        "name": "name",
                        "type": "text",
                        "label": "Name"
                      },
                      {
                        "name": "color",
                        "type": "text",
                        "label": "Color"
                      }
                    ],
                    "type": "collection"
                  },
                  "type": "array",
                  "label": "Multi Select"
                },
                {
                  "name": "date",
                  "spec": [
                    {
                      "name": "start",
                      "type": "text",
                      "label": "Start"
                    },
                    {
                      "name": "end",
                      "type": "text",
                      "label": "End"
                    }
                  ],
                  "type": "collection",
                  "label": "Date"
                },
                {
                  "name": "checkbox",
                  "type": "boolean",
                  "label": "Checkbox"
                },
                {
                  "name": "number",
                  "type": "number",
                  "label": "Number"
                },
                {
                  "name": "files",
                  "spec": {
                    "spec": [
                      {
                        "name": "name",
                        "type": "text",
                        "label": "Name"
                      }
                    ],
                    "type": "collection"
                  },
                  "type": "array",
                  "label": "Files"
                },
                {
                  "name": "title",
                  "spec": {
                    "spec": [
                      {
                        "name": "type",
                        "type": "text",
                        "label": "Type"
                      },
                      {
                        "name": "text",
                        "spec": [
                          {
                            "name": "content",
                            "type": "text",
                            "label": "Content"
                          },
                          {
                            "name": "link",
                            "type": "text",
                            "label": "Link"
                          }
                        ],
                        "type": "collection",
                        "label": "Text"
                      },
                      {
                        "name": "annotations",
                        "spec": [
                          {
                            "name": "bold",
                            "type": "boolean",
                            "label": "Bold"
                          },
                          {
                            "name": "italic",
                            "type": "boolean",
                            "label": "Italic"
                          },
                          {
                            "name": "strikethrough",
                            "type": "boolean",
                            "label": "Strikethrough"
                          },
                          {
                            "name": "underline",
                            "type": "boolean",
                            "label": "Underline"
                          },
                          {
                            "name": "code",
                            "type": "boolean",
                            "label": "Code"
                          },
                          {
                            "name": "color",
                            "type": "text",
                            "label": "Color"
                          }
                        ],
                        "type": "collection",
                        "label": "Annotations"
                      },
                      {
                        "name": "plain_text",
                        "type": "text",
                        "label": "Plain Text"
                      },
                      {
                        "name": "href",
                        "type": "text",
                        "label": "Href"
                      }
                    ],
                    "type": "collection"
                  },
                  "type": "array",
                  "label": "Title"
                },
                {
                  "name": "last_edited_time",
                  "time": true,
                  "type": "date",
                  "label": "Last Edited Time"
                },
                {
                  "name": "created_time",
                  "time": true,
                  "type": "date",
                  "label": "Created Time"
                },
                {
                  "name": "last_edited_by",
                  "spec": [
                    {
                      "name": "object",
                      "type": "text",
                      "label": "Object"
                    },
                    {
                      "name": "id",
                      "type": "text",
                      "label": "ID"
                    },
                    {
                      "name": "name",
                      "type": "text",
                      "label": "Name"
                    },
                    {
                      "name": "avatar_url",
                      "type": "text",
                      "label": "Avatar Url"
                    },
                    {
                      "name": "type",
                      "type": "text",
                      "label": "Type"
                    },
                    {
                      "name": "person",
                      "spec": [
                        {
                          "name": "email",
                          "type": "text",
                          "label": "Email"
                        }
                      ],
                      "type": "collection",
                      "label": "Person"
                    }
                  ],
                  "type": "collection",
                  "label": "Last Edited By"
                },
                {
                  "name": "created_by",
                  "spec": [
                    {
                      "name": "object",
                      "type": "text",
                      "label": "Object"
                    },
                    {
                      "name": "id",
                      "type": "text",
                      "label": "ID"
                    },
                    {
                      "name": "name",
                      "type": "text",
                      "label": "Name"
                    },
                    {
                      "name": "avatar_url",
                      "type": "text",
                      "label": "Avatar Url"
                    },
                    {
                      "name": "type",
                      "type": "text",
                      "label": "Type"
                    },
                    {
                      "name": "person",
                      "spec": [
                        {
                          "name": "email",
                          "type": "text",
                          "label": "Email"
                        }
                      ],
                      "type": "collection",
                      "label": "Person"
                    }
                  ],
                  "type": "collection",
                  "label": "Created By"
                },
                {
                  "name": "formula",
                  "spec": [
                    {
                      "name": "type",
                      "type": "text",
                      "label": "Type"
                    },
                    {
                      "name": "string",
                      "type": "text",
                      "label": "String"
                    }
                  ],
                  "type": "collection",
                  "label": "Formula"
                },
                {
                  "name": "relation",
                  "spec": {
                    "spec": [
                      {
                        "name": "id",
                        "type": "text",
                        "label": "ID"
                      }
                    ],
                    "type": "collection"
                  },
                  "type": "array",
                  "label": "Relation"
                },
                {
                  "name": "label",
                  "type": "text",
                  "label": "Label"
                }
              ],
              "type": "collection"
            },
            "type": "array",
            "label": "Properties"
          },
          {
            "name": "properties_value",
            "spec": [
              {
                "name": "Category",
                "spec": [
                  {
                    "name": "id",
                    "type": "text",
                    "label": "ID"
                  },
                  {
                    "name": "name",
                    "type": "text",
                    "label": "Name"
                  },
                  {
                    "name": "color",
                    "type": "text",
                    "label": "Color"
                  }
                ],
                "type": "collection",
                "label": "Category"
              },
              {
                "name": "Priority",
                "spec": [
                  {
                    "name": "id",
                    "type": "text",
                    "label": "ID"
                  },
                  {
                    "name": "name",
                    "type": "text",
                    "label": "Name"
                  },
                  {
                    "name": "color",
                    "type": "text",
                    "label": "Color"
                  }
                ],
                "type": "collection",
                "label": "Priority"
              },
              {
                "name": "Status",
                "spec": [
                  {
                    "name": "id",
                    "type": "text",
                    "label": "ID"
                  },
                  {
                    "name": "name",
                    "type": "text",
                    "label": "Name"
                  },
                  {
                    "name": "color",
                    "type": "text",
                    "label": "Color"
                  }
                ],
                "type": "collection",
                "label": "Status"
              },
              {
                "name": "Assign",
                "spec": [
                  {
                    "name": "object",
                    "type": "text",
                    "label": "Object"
                  },
                  {
                    "name": "id",
                    "type": "text",
                    "label": "ID"
                  },
                  {
                    "name": "name",
                    "type": "text",
                    "label": "Name"
                  },
                  {
                    "name": "avatar_url",
                    "type": "text",
                    "label": "Avatar Url"
                  },
                  {
                    "name": "type",
                    "type": "text",
                    "label": "Type"
                  },
                  {
                    "name": "person",
                    "spec": [
                      {
                        "name": "email",
                        "type": "text",
                        "label": "Email"
                      }
                    ],
                    "type": "collection",
                    "label": "Person"
                  }
                ],
                "type": "array",
                "label": "Assign"
              },
              {
                "name": "Name",
                "spec": [
                  {
                    "name": "type",
                    "type": "text",
                    "label": "Type"
                  },
                  {
                    "name": "text",
                    "spec": [
                      {
                        "name": "content",
                        "type": "text",
                        "label": "Content"
                      },
                      {
                        "name": "link",
                        "type": "text",
                        "label": "Link"
                      }
                    ],
                    "type": "collection",
                    "label": "Text"
                  },
                  {
                    "name": "annotations",
                    "spec": [
                      {
                        "name": "bold",
                        "type": "boolean",
                        "label": "Bold"
                      },
                      {
                        "name": "italic",
                        "type": "boolean",
                        "label": "Italic"
                      },
                      {
                        "name": "strikethrough",
                        "type": "boolean",
                        "label": "Strikethrough"
                      },
                      {
                        "name": "underline",
                        "type": "boolean",
                        "label": "Underline"
                      },
                      {
                        "name": "code",
                        "type": "boolean",
                        "label": "Code"
                      },
                      {
                        "name": "color",
                        "type": "text",
                        "label": "Color"
                      }
                    ],
                    "type": "collection",
                    "label": "Annotations"
                  },
                  {
                    "name": "plain_text",
                    "type": "text",
                    "label": "Plain Text"
                  },
                  {
                    "name": "href",
                    "type": "text",
                    "label": "Href"
                  }
                ],
                "type": "array",
                "label": "Name"
              }
            ],
            "type": "collection",
            "label": "Properties Value"
          }
        ]
      }
    },
    {
      "id": 3,
      "module": "gateway:WebhookRespond",
      "version": 1,
      "parameters": {},
      "mapper": {
        "status": "200",
        "body": "",
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
            "validate": {
              "min": 100
            },
            "required": true
          },
          {
            "name": "body",
            "type": "any",
            "label": "Body"
          },
          {
            "name": "headers",
            "type": "array",
            "label": "Custom headers",
            "validate": {
              "maxItems": 16
            },
            "spec": [
              {
                "name": "key",
                "label": "Key",
                "type": "text",
                "required": true,
                "validate": {
                  "max": 256
                }
              },
              {
                "name": "value",
                "label": "Value",
                "type": "text",
                "required": true,
                "validate": {
                  "max": 4096
                }
              }
            ]
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
