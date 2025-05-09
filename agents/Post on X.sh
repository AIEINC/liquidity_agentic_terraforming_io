#!/bin/bash
# Auto-generated launcher for Post on X
echo "Running agent: Post on X"
cat <<EOF
{
  "name": "Post on X",
  "flow": [
    {
      "id": 1,
      "module": "gateway:CustomWebHook",
      "version": 1,
      "parameters": {
        "hook": 1604839,
        "maxResults": 1
      },
      "mapper": {},
      "metadata": {
        "designer": {
          "x": -376,
          "y": -23
        },
        "restore": {
          "parameters": {
            "hook": {
              "data": {
                "editable": "true"
              },
              "label": "Webhook Social media"
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
      "id": 15,
      "module": "http:ActionGetFile",
      "version": 3,
      "parameters": {
        "handleErrors": false
      },
      "mapper": {
        "url": "{{1.image}}",
        "method": "get",
        "serializeUrl": false,
        "shareCookies": false
      },
      "metadata": {
        "designer": {
          "x": -122,
          "y": -26
        },
        "restore": {},
        "parameters": [
          {
            "name": "handleErrors",
            "type": "boolean",
            "label": "Evaluate all states as errors (except for 2xx and 3xx )",
            "required": true
          }
        ],
        "expect": [
          {
            "name": "url",
            "type": "url",
            "label": "URL",
            "required": true
          },
          {
            "name": "serializeUrl",
            "type": "boolean",
            "label": "Serialize URL",
            "required": true
          },
          {
            "name": "method",
            "type": "hidden",
            "label": "Method"
          },
          {
            "name": "shareCookies",
            "type": "boolean",
            "label": "Share cookies with other HTTP modules",
            "required": true
          }
        ]
      }
    },
    {
      "id": 14,
      "module": "twitter:uploadAMedia",
      "version": 5,
      "parameters": {
        "__IMTCONN__": 3186720
      },
      "mapper": {
        "select": "image",
        "attachments": [
          {
            "data": "{{15.data}}",
            "filename": "{{15.fileName}}"
          }
        ]
      },
      "metadata": {
        "designer": {
          "x": 148,
          "y": -15
        },
        "restore": {
          "expect": {
            "select": {
              "label": "Image or GIF (Size less than 5MB)"
            },
            "attachments": {
              "mode": "chose",
              "items": [
                null
              ]
            }
          },
          "parameters": {
            "__IMTCONN__": {
              "data": {
                "scoped": "true",
                "connection": "twitter"
              },
              "label": "My X (formerly Twitter) connection (Ben Van Sprundel)"
            }
          }
        },
        "parameters": [
          {
            "name": "__IMTCONN__",
            "type": "account:twitter",
            "label": "Connection",
            "required": true
          }
        ],
        "expect": [
          {
            "name": "select",
            "type": "select",
            "label": "Upload",
            "required": true,
            "validate": {
              "enum": [
                "image",
                "video"
              ]
            }
          },
          {
            "name": "attachments",
            "spec": [
              {
                "name": "filename",
                "type": "filename",
                "label": "File Name",
                "required": true,
                "semantic": "file:name"
              },
              {
                "name": "data",
                "type": "buffer",
                "label": "Data",
                "required": true,
                "semantic": "file:data"
              }
            ],
            "type": "array",
            "label": "Attachments",
            "required": true,
            "validate": {
              "maxItems": 4
            }
          }
        ]
      }
    },
    {
      "id": 11,
      "module": "twitter:createATweet",
      "version": 6,
      "parameters": {
        "__IMTCONN__": 3186702
      },
      "mapper": {
        "text": "{{1.`X post`}}",
        "media_ids": "{{14.media_ids}}"
      },
      "metadata": {
        "designer": {
          "x": 457,
          "y": -24
        },
        "restore": {
          "expect": {
            "media_ids": {
              "mode": "edit"
            },
            "for_super_followers_only": {
              "mode": "chose"
            }
          },
          "parameters": {
            "__IMTCONN__": {
              "data": {
                "scoped": "true",
                "connection": "twitter2"
              },
              "label": "My X (formerly Twitter) OAuth 2.0 connection (ben_vs92)"
            }
          }
        },
        "parameters": [
          {
            "name": "__IMTCONN__",
            "type": "account:twitter2",
            "label": "Connection",
            "required": true
          }
        ],
        "expect": [
          {
            "name": "text",
            "type": "text",
            "label": "Text Content",
            "required": true
          },
          {
            "mode": "edit",
            "name": "media_ids",
            "spec": {
              "name": "value",
              "type": "text"
            },
            "type": "array",
            "label": "Media IDs"
          },
          {
            "name": "place_id",
            "type": "text",
            "label": "Place ID"
          },
          {
            "name": "direct_message_deep_link",
            "type": "url",
            "label": "Direct Message Link"
          },
          {
            "name": "for_super_followers_only",
            "type": "boolean",
            "label": "Allow to Post Exclusively for Super Followers Only"
          },
          {
            "name": "quote_tweet_id",
            "type": "text",
            "label": "Quote Post ID"
          }
        ],
        "advanced": true
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
