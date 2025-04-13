#!/bin/bash
# Auto-generated launcher for Update youtube content calendar
echo "Running agent: Update youtube content calendar"
cat <<EOF
{
  "name": "Update youtube content calendar",
  "flow": [
    {
      "id": 1,
      "module": "gateway:CustomWebHook",
      "version": 1,
      "parameters": {
        "hook": 1697168,
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
          "NUBr": "\ud83d\udd25",
          "yjiJ": "Not started",
          "title": "{{1.Task}}"
        },
        "select": "list",
        "database": "3b1dfa3a89954c89a8ab3743cfe05038"
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
                "NUBr": {
                  "mode": "chose",
                  "label": "\ud83d\udd25"
                },
                "RRsz": {
                  "mode": "chose"
                },
                "haBT": {
                  "mode": "chose"
                },
                "yjiJ": {
                  "mode": "chose",
                  "label": "Not started"
                },
                "%5CMnU": {
                  "mode": "chose"
                },
                "L%5Bye": {
                  "mode": "chose"
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
                      "label": "Idea",
                      "metadata": {
                        "type": "title"
                      },
                      "required": true
                    },
                    {
                      "name": "L%5Bye",
                      "type": "boolean",
                      "label": "2 hour build?",
                      "metadata": {
                        "type": "checkbox"
                      }
                    },
                    {
                      "name": "NUBr",
                      "type": "select",
                      "label": "Potential",
                      "options": [
                        {
                          "label": "Probably low",
                          "value": "Probably low"
                        },
                        {
                          "label": "Dont know",
                          "value": "Dont know"
                        },
                        {
                          "label": "High",
                          "value": "High"
                        },
                        {
                          "label": "\ud83d\udd25",
                          "value": "\ud83d\udd25"
                        }
                      ],
                      "metadata": {
                        "type": "select"
                      },
                      "validate": false
                    },
                    {
                      "name": "RRsz",
                      "type": "select",
                      "label": "Category",
                      "options": [
                        {
                          "label": "Full course",
                          "value": "Full course"
                        },
                        {
                          "label": "Relevance AI",
                          "value": "Relevance AI"
                        },
                        {
                          "label": "Sales",
                          "value": "Sales"
                        },
                        {
                          "label": "Make.com",
                          "value": "Make.com"
                        },
                        {
                          "label": "Relevance AI Tutorial",
                          "value": "Relevance AI Tutorial"
                        }
                      ],
                      "metadata": {
                        "type": "multi_select"
                      },
                      "multiple": true,
                      "validate": false
                    },
                    {
                      "name": "%5BKR%7D",
                      "type": "text",
                      "label": "Title",
                      "metadata": {
                        "type": "rich_text"
                      }
                    },
                    {
                      "name": "%5CMnU",
                      "type": "boolean",
                      "label": "Built?",
                      "metadata": {
                        "type": "checkbox"
                      }
                    },
                    {
                      "name": "dgh%7C",
                      "type": "text",
                      "label": "Thumbnail",
                      "metadata": {
                        "type": "rich_text"
                      }
                    },
                    {
                      "name": "haBT",
                      "type": "boolean",
                      "label": "Done",
                      "metadata": {
                        "type": "checkbox"
                      }
                    },
                    {
                      "name": "yjiJ",
                      "type": "select",
                      "label": "Process",
                      "grouped": true,
                      "options": [
                        {
                          "label": "To-do",
                          "options": [
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
                              "label": "Building",
                              "value": "Building"
                            }
                          ]
                        },
                        {
                          "label": "Complete",
                          "options": [
                            {
                              "label": "Built",
                              "value": "Built"
                            },
                            {
                              "label": "Filmed",
                              "value": "Filmed"
                            },
                            {
                              "label": "Uploaded",
                              "value": "Uploaded"
                            }
                          ]
                        }
                      ],
                      "metadata": {
                        "type": "status"
                      }
                    },
                    {
                      "name": "ziEk",
                      "type": "text",
                      "label": "Hook",
                      "metadata": {
                        "type": "rich_text"
                      }
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
                "label": "Idea",
                "metadata": {
                  "type": "title"
                },
                "required": true
              },
              {
                "name": "L%5Bye",
                "type": "boolean",
                "label": "2 hour build?",
                "metadata": {
                  "type": "checkbox"
                }
              },
              {
                "name": "NUBr",
                "type": "select",
                "label": "Potential",
                "metadata": {
                  "type": "select"
                }
              },
              {
                "name": "RRsz",
                "type": "select",
                "label": "Category",
                "metadata": {
                  "type": "multi_select"
                },
                "multiple": true
              },
              {
                "name": "%5BKR%7D",
                "type": "text",
                "label": "Title",
                "metadata": {
                  "type": "rich_text"
                }
              },
              {
                "name": "%5CMnU",
                "type": "boolean",
                "label": "Built?",
                "metadata": {
                  "type": "checkbox"
                }
              },
              {
                "name": "dgh%7C",
                "type": "text",
                "label": "Thumbnail",
                "metadata": {
                  "type": "rich_text"
                }
              },
              {
                "name": "haBT",
                "type": "boolean",
                "label": "Done",
                "metadata": {
                  "type": "checkbox"
                }
              },
              {
                "name": "yjiJ",
                "type": "select",
                "label": "Process",
                "metadata": {
                  "type": "status"
                },
                "validate": {
                  "enum": [
                    "Not started",
                    "Building",
                    "Built",
                    "Filmed",
                    "Uploaded"
                  ]
                }
              },
              {
                "name": "ziEk",
                "type": "text",
                "label": "Hook",
                "metadata": {
                  "type": "rich_text"
                }
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
                "name": "2 hour build?",
                "type": "boolean",
                "label": "2 hour build?"
              },
              {
                "name": "Potential",
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
                "label": "Potential"
              },
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
                "type": "array",
                "label": "Category"
              },
              {
                "name": "Title",
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
                "label": "Title"
              },
              {
                "name": "Built?",
                "type": "boolean",
                "label": "Built?"
              },
              {
                "name": "Thumbnail",
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
                "label": "Thumbnail"
              },
              {
                "name": "Done",
                "type": "boolean",
                "label": "Done"
              },
              {
                "name": "Process",
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
                "label": "Process"
              },
              {
                "name": "Hook",
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
                "label": "Hook"
              },
              {
                "name": "Idea",
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
                "label": "Idea"
              }
            ],
            "type": "collection",
            "label": "Properties Value"
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
