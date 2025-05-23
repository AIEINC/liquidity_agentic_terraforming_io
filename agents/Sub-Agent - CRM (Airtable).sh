#!/bin/bash
# Auto-generated launcher for Sub-Agent - CRM (Airtable)
echo "Running agent: Sub-Agent - CRM (Airtable)"
cat <<EOF
{
  "name": "Sub-Agent - CRM (Airtable)",
  "nodes": [
    {
      "parameters": {
        "assignments": {
          "assignments": [
            {
              "id": "4f360190-a717-4a93-8336-d03ea65975d5",
              "name": "response",
              "value": "={{ $json.output }}",
              "type": "string"
            }
          ]
        },
        "options": {}
      },
      "type": "n8n-nodes-base.set",
      "typeVersion": 3.4,
      "position": [
        -460,
        -180
      ],
      "id": "bab4dfd9-a547-4906-a874-6f9dc583db55",
      "name": "Response"
    },
    {
      "parameters": {
        "assignments": {
          "assignments": [
            {
              "id": "4f360190-a717-4a93-8336-d03ea65975d5",
              "name": "response",
              "value": "An error occurred. Please try again.",
              "type": "string"
            }
          ]
        },
        "options": {}
      },
      "type": "n8n-nodes-base.set",
      "typeVersion": 3.4,
      "position": [
        -460,
        -20
      ],
      "id": "f335a2f3-58b7-48e1-af5b-f3cf8d4edcc0",
      "name": "Try Again"
    },
    {
      "parameters": {
        "inputSource": "jsonExample",
        "jsonExample": "{\n  \"query\": \"string\"\n}"
      },
      "type": "n8n-nodes-base.executeWorkflowTrigger",
      "typeVersion": 1.1,
      "position": [
        -1380,
        -20
      ],
      "id": "a37aaaca-d446-4864-afe2-5d3d418eebcb",
      "name": "When Executed by Another Workflow"
    },
    {
      "parameters": {
        "resource": "base",
        "operation": "getSchema",
        "base": {
          "__rl": true,
          "value": "appmZHna96JsKNeJL",
          "mode": "list",
          "cachedResultName": "n8n Sales Agent (BenAI)",
          "cachedResultUrl": "https://airtable.com/appmZHna96JsKNeJL"
        }
      },
      "type": "n8n-nodes-base.airtableTool",
      "typeVersion": 2.1,
      "position": [
        -380,
        200
      ],
      "id": "44a98570-be92-425b-89b1-51b6a5c0d608",
      "name": "get_schema",
      "credentials": {
        "airtableTokenApi": {
          "id": "oFWi9c8fpUUAVcKu",
          "name": "BenAI & Cobuild "
        }
      }
    },
    {
      "parameters": {
        "promptType": "define",
        "text": "={{ $json.query }}",
        "options": {
          "systemMessage": "=\n=# CRM Management Assistant\n\n## Overview\nYou are a CRM assistant managing contacts and opportunities in Airtable. Your role is to ensure data consistency through proper schema validation and tool sequencing.\n\n## Handling Input Query for Contacts\n- Your primary input is the `query` string (e.g., \"Name, email@example.com, interested in Service\").\n- **If the query clearly contains contact Name and Email:**\n  1. **PARSE** the Name and Email directly from the `query` string.\n  2. **Immediately use the `upsert_contact` tool.** Provide the extracted details using the exact parameter names: `Name` and `Email`. Extract ONLY the relevant contact details for the tool.\n  3. Only use other tools (`list_records`, `create_opportunity`, etc.) if the `query` *explicitly* asks for searching, opportunity creation, or updates beyond simple contact info.\n\n## Intent Recognition for Opportunities\n- Recognize \"interest in X\", \"interested in X\" as triggers to create a new opportunity\n- When interest is mentioned but Status/Priority not specified, default to:\n  * Status: \"Qualification\"\n  * Priority: \"Medium\"\n  * Opportunity_Name: Include the interest subject (e.g., \"Ceramic Coating Interest\")\n\n## Parameter Formatting Rules\n- Always format Contact_ID for Primary_Contact as an array: [contactId]\n- For upsert_contact: Parse and extract \"Name\" and \"Email\" first\n- For create_opportunity: Ensure all required fields are populated\n\n## Schema Management\n\n### Initial Schema Loading\n- On first interaction in a conversation:\n  1. Call get_schema to retrieve table structures\n  2. Store schema in conversation memory\n  3. Use cached schema for all subsequent validations\n\n### Schema Validation Rules\n- Use cached schema from memory for validations\n- Only call get_schema if:\n  1. First interaction in conversation\n  2. Schema not found in memory\n  3. Explicit request to refresh schema\n\n## Tool Sequence and Usage\n\n### 1. get_schema\n**When to use:**\n- At conversation start\n- When schema validation needed\n- When schema memory expired\n\n**Purpose:**\n- Retrieve table IDs\n- Get valid field options\n- Validate data structure\n\n### 2. list_records (Search)\n**When to use:**\n- Before any update operation\n- When searching for contacts/opportunities\n- To verify record existence\n\n**Required parameters:**\n- table_ID (from schema)\n- searchTerm\n- dataFieldName (from schema)\n\n**Example flows:**\n```\n\"Find john@example.com\":\n1. Use schema to get Contacts table_ID & dataFieldName for email\n2. Search with email\n3. Return record ID if found\n\n\"Find opportunity ABC Corp\":\n1. Use schema to get Opportunities table_ID and dataFieldName for company name\n2. Search with company name\n3. Return record ID if found\n```\n\n### 3. upsert_contact\n**When to use:**\n- Use this **FIRST** if the input query provides Name and Email directly.\n- Search and create contact by email in one step.\n- When creating new contact\n- When updating contact details\n\n**Required parameters:**\n- id (for updates, from list_records; not required when creating new contact)\n- Name\n- Email\n- Phone (optional - create contact immediately if name and email have been provided)\n\n### 4. create_opportunity\n**When to use:**\n- After successful opportunity search OR after creating/finding a contact (`upsert_contact`) if the original query indicated an opportunity should be created.\n- For adding new opportunity\n\n**Required parameters:**\n- Opportunity_Name\n- Status (validate against schema)\n- Priority (validate against schema)\n- contact_id (from upsert_contact after new contact is created)\n\n\n### 5. update_opportunity\n**When to use:**\n- After successful opportunity search\n- When status or priority changes\n- For deal stage updates\n\n**Required parameters:**\n- id (from list_records)\n- Status (validate against schema)\n- Priority (validate against schema)\n\n\n## Operation Flows\n\n### 1. New Contact Creation (From simple query like \"Name, Email\")\n```\n1. Parse Name and Email from query.\n2. Call upsert_contact with Name and Email.\n3. Return new/updated record ID.\n```\n\n### 2. Opportunity Info Update\n```\n1. Validate schema in memory\n2. Search for opportunity using list_records\n3. Use update_opportunity to update status or priority\n4. Confirm change\n```\n\n### 3. Contact Update (If query specifies updating existing contact)\n```\n1. Search for existing contact using list_records (likely by email from query)\n2. Verify found record\n3. Use upsert_contact with record ID and updated fields from query\n4. Return updated record ID\n```\n\n### 4. New Opportunity Creation (If query asks to create opportunity)\n```\n1. Call get_schema if needed\n2. Use upsert_contact to find/create the relevant contact (extracting details from query). Get Contact_ID.\n3. Use create_opportunity with details from query and the Contact_ID.\n```\nOpportunity Status Mapping\nQualification -> Verified contact information\nMeeting Booked -> consultation or detailing services booking confirmed\n\n## Response Format\n\n### Success Case:\n```javascript\n{\n  \"action\": \"[search|create|update|upsert]\",\n  \"status\": \"success\",\n  \"data\": {\n    \"id\": \"[record_id]\",\n    \"type\": \"[contact|opportunity]\",\n    \"details\": { /* relevant fields */ },\n    \"contact_id\": \"[record_id]\" //for new contact creation only via upsert_contact\n  }\n}\n```\n\n### Error Case:\n```javascript\n{\n  \"status\": \"error\",\n  \"type\": \"[validation|not_found|schema_error|parse_error]\",\n  \"message\": \"Specific error details\",\n  \"validOptions\": [ /* if applicable */ ]\n}\n```\n\n## Error Handling\n\n1. Schema Validation:\n   - Check memory first\n   - Refresh schema if needed\n   - Return valid options\n\n2. Record Not Found:\n   - Suggest creation for contacts\n   - Request clarification for opportunities\n   - List required information\n\n3. Invalid Values:\n   - Show valid options from schema\n   - Explain validation failure\n   - Guide to correct format\n```"
        }
      },
      "type": "@n8n/n8n-nodes-langchain.agent",
      "typeVersion": 1.7,
      "position": [
        -1000,
        -20
      ],
      "id": "03283560-81fa-45fb-8ae9-beb7477de98e",
      "name": "CRM Assistant",
      "onError": "continueErrorOutput"
    },
    {
      "parameters": {
        "operation": "search",
        "base": {
          "__rl": true,
          "value": "appmZHna96JsKNeJL",
          "mode": "list",
          "cachedResultName": "n8n Sales Agent (BenAI)",
          "cachedResultUrl": "https://airtable.com/appmZHna96JsKNeJL"
        },
        "table": {
          "__rl": true,
          "value": "={{ $fromAI(\"table_ID\") }}",
          "mode": "id"
        },
        "filterByFormula": "=SEARCH(\"{{ $fromAI('searchTerm') }}\", {{ $fromAI('dataFieldName') }})",
        "options": {}
      },
      "type": "n8n-nodes-base.airtableTool",
      "typeVersion": 2.1,
      "position": [
        -540,
        200
      ],
      "id": "58a1dea2-16df-42f2-ba28-4ba9ba3ef583",
      "name": "list_records",
      "credentials": {
        "airtableTokenApi": {
          "id": "oFWi9c8fpUUAVcKu",
          "name": "BenAI & Cobuild "
        }
      }
    },
    {
      "parameters": {
        "sessionIdType": "customKey",
        "sessionKey": "={{ $json.query }}"
      },
      "type": "@n8n/n8n-nodes-langchain.memoryBufferWindow",
      "typeVersion": 1.3,
      "position": [
        -1120,
        200
      ],
      "id": "a2018b71-cdb6-42ba-8580-ae3c36bf76b0",
      "name": "Window Buffer Memory"
    },
    {
      "parameters": {
        "operation": "create",
        "base": {
          "__rl": true,
          "value": "appmZHna96JsKNeJL",
          "mode": "list",
          "cachedResultName": "n8n Sales Agent (BenAI)",
          "cachedResultUrl": "https://airtable.com/appmZHna96JsKNeJL"
        },
        "table": {
          "__rl": true,
          "value": "tbl3yCddn8oTpBIX3",
          "mode": "list",
          "cachedResultName": "Opportunities",
          "cachedResultUrl": "https://airtable.com/appmZHna96JsKNeJL/tbl3yCddn8oTpBIX3"
        },
        "columns": {
          "mappingMode": "defineBelow",
          "value": {
            "Opportunity_Name": "={{ $fromAI('Opportunity_Name') }}",
            "Status": "={{ $fromAI('Status') }}",
            "Priority": "={{ $fromAI('Priority') }}",
            "Primary_Contact": "={{ [$fromAI('Contact_ID')] }}"
          },
          "matchingColumns": [],
          "schema": [
            {
              "id": "Opportunity_Name",
              "displayName": "Opportunity_Name",
              "required": false,
              "defaultMatch": false,
              "canBeUsedToMatch": true,
              "display": true,
              "type": "string",
              "readOnly": false,
              "removed": false
            },
            {
              "id": "Status",
              "displayName": "Status",
              "required": false,
              "defaultMatch": false,
              "canBeUsedToMatch": true,
              "display": true,
              "type": "options",
              "options": [
                {
                  "name": "Qualification",
                  "value": "Qualification"
                },
                {
                  "name": "Meeting Booked",
                  "value": "Meeting Booked"
                },
                {
                  "name": "Proposal",
                  "value": "Proposal"
                },
                {
                  "name": "Closed - Won",
                  "value": "Closed - Won"
                },
                {
                  "name": "Evaluation",
                  "value": "Evaluation"
                },
                {
                  "name": "Closed - Lost",
                  "value": "Closed - Lost"
                },
                {
                  "name": "Negotiation",
                  "value": "Negotiation"
                }
              ],
              "readOnly": false,
              "removed": false
            },
            {
              "id": "Priority",
              "displayName": "Priority",
              "required": false,
              "defaultMatch": false,
              "canBeUsedToMatch": true,
              "display": true,
              "type": "options",
              "options": [
                {
                  "name": "Very High",
                  "value": "Very High"
                },
                {
                  "name": "High",
                  "value": "High"
                },
                {
                  "name": "Medium",
                  "value": "Medium"
                },
                {
                  "name": "Low",
                  "value": "Low"
                },
                {
                  "name": "Very Low / Deprioritize",
                  "value": "Very Low / Deprioritize"
                }
              ],
              "readOnly": false,
              "removed": false
            },
            {
              "id": "Estimated_Value",
              "displayName": "Estimated_Value",
              "required": false,
              "defaultMatch": false,
              "canBeUsedToMatch": true,
              "display": true,
              "type": "number",
              "readOnly": false,
              "removed": true
            },
            {
              "id": "Primary_Contact",
              "displayName": "Primary_Contact",
              "required": false,
              "defaultMatch": false,
              "canBeUsedToMatch": true,
              "display": true,
              "type": "array",
              "readOnly": false,
              "removed": false
            }
          ],
          "attemptToConvertTypes": false,
          "convertFieldsToString": false
        },
        "options": {}
      },
      "type": "n8n-nodes-base.airtableTool",
      "typeVersion": 2.1,
      "position": [
        -220,
        200
      ],
      "id": "414f35dd-31bb-48ee-aac9-c427093416f1",
      "name": "create_opportunity",
      "credentials": {
        "airtableTokenApi": {
          "id": "oFWi9c8fpUUAVcKu",
          "name": "BenAI & Cobuild "
        }
      }
    },
    {
      "parameters": {
        "operation": "update",
        "base": {
          "__rl": true,
          "value": "appmZHna96JsKNeJL",
          "mode": "list",
          "cachedResultName": "n8n Sales Agent (BenAI)",
          "cachedResultUrl": "https://airtable.com/appmZHna96JsKNeJL"
        },
        "table": {
          "__rl": true,
          "value": "tbl3yCddn8oTpBIX3",
          "mode": "list",
          "cachedResultName": "Opportunities",
          "cachedResultUrl": "https://airtable.com/appmZHna96JsKNeJL/tbl3yCddn8oTpBIX3"
        },
        "columns": {
          "mappingMode": "defineBelow",
          "value": {
            "Estimated_Value": 0,
            "id": "={{ $fromAI('id') }}",
            "Status": "={{ $fromAI('Status') }}",
            "Priority": "={{ $fromAI('Priority') }}",
            "Primary_Contact": "="
          },
          "matchingColumns": [
            "id"
          ],
          "schema": [
            {
              "id": "id",
              "displayName": "id",
              "required": false,
              "defaultMatch": true,
              "display": true,
              "type": "string",
              "readOnly": true,
              "removed": false
            },
            {
              "id": "Opportunity_Name",
              "displayName": "Opportunity_Name",
              "required": false,
              "defaultMatch": false,
              "canBeUsedToMatch": true,
              "display": true,
              "type": "string",
              "readOnly": false,
              "removed": true
            },
            {
              "id": "Status",
              "displayName": "Status",
              "required": false,
              "defaultMatch": false,
              "canBeUsedToMatch": true,
              "display": true,
              "type": "options",
              "options": [
                {
                  "name": "Qualification",
                  "value": "Qualification"
                },
                {
                  "name": "Meeting Booked",
                  "value": "Meeting Booked"
                },
                {
                  "name": "Proposal",
                  "value": "Proposal"
                },
                {
                  "name": "Closed - Won",
                  "value": "Closed - Won"
                },
                {
                  "name": "Evaluation",
                  "value": "Evaluation"
                },
                {
                  "name": "Closed - Lost",
                  "value": "Closed - Lost"
                },
                {
                  "name": "Negotiation",
                  "value": "Negotiation"
                }
              ],
              "readOnly": false,
              "removed": false
            },
            {
              "id": "Priority",
              "displayName": "Priority",
              "required": false,
              "defaultMatch": false,
              "canBeUsedToMatch": true,
              "display": true,
              "type": "options",
              "options": [
                {
                  "name": "Very High",
                  "value": "Very High"
                },
                {
                  "name": "High",
                  "value": "High"
                },
                {
                  "name": "Medium",
                  "value": "Medium"
                },
                {
                  "name": "Low",
                  "value": "Low"
                },
                {
                  "name": "Very Low / Deprioritize",
                  "value": "Very Low / Deprioritize"
                }
              ],
              "readOnly": false,
              "removed": false
            },
            {
              "id": "Estimated_Value",
              "displayName": "Estimated_Value",
              "required": false,
              "defaultMatch": false,
              "canBeUsedToMatch": true,
              "display": true,
              "type": "number",
              "readOnly": false,
              "removed": false
            },
            {
              "id": "Primary_Contact",
              "displayName": "Primary_Contact",
              "required": false,
              "defaultMatch": false,
              "canBeUsedToMatch": true,
              "display": true,
              "type": "array",
              "readOnly": false,
              "removed": false
            }
          ],
          "attemptToConvertTypes": false,
          "convertFieldsToString": false
        },
        "options": {}
      },
      "type": "n8n-nodes-base.airtableTool",
      "typeVersion": 2.1,
      "position": [
        -680,
        200
      ],
      "id": "0e7fa74d-ffc5-4cf7-ab04-8b878bd98940",
      "name": "update_opportunity",
      "credentials": {
        "airtableTokenApi": {
          "id": "oFWi9c8fpUUAVcKu",
          "name": "BenAI & Cobuild "
        }
      }
    },
    {
      "parameters": {
        "model": {
          "__rl": true,
          "mode": "list",
          "value": "gpt-4o-mini"
        },
        "options": {}
      },
      "type": "@n8n/n8n-nodes-langchain.lmChatOpenAi",
      "typeVersion": 1.2,
      "position": [
        -1240,
        200
      ],
      "id": "9e1b6236-33b8-4120-82db-53aade65a05f",
      "name": "OpenAI Chat Model",
      "credentials": {
        "openAiApi": {
          "id": "5c3Kk8Dl0PYVj8b0",
          "name": "Ben OpenAI Key"
        }
      }
    },
    {
      "parameters": {
        "operation": "create",
        "base": {
          "__rl": true,
          "value": "appmZHna96JsKNeJL",
          "mode": "list",
          "cachedResultName": "n8n Sales Agent (BenAI)",
          "cachedResultUrl": "https://airtable.com/appmZHna96JsKNeJL"
        },
        "table": {
          "__rl": true,
          "value": "tblIWVK0K0l5x8MD4",
          "mode": "list",
          "cachedResultName": "Contacts",
          "cachedResultUrl": "https://airtable.com/appmZHna96JsKNeJL/tblIWVK0K0l5x8MD4"
        },
        "columns": {
          "mappingMode": "defineBelow",
          "value": {
            "Name": "={{ /*n8n-auto-generated-fromAI-override*/ $fromAI('Name', `Name of the prospect`, 'string') }}",
            "Email": "={{ /*n8n-auto-generated-fromAI-override*/ $fromAI('Email', `Email address`, 'string') }}",
            "Phone": "={{ /*n8n-auto-generated-fromAI-override*/ $fromAI('Phone', `Interested services`, 'string') }}"
          },
          "matchingColumns": [
            "id"
          ],
          "schema": [
            {
              "id": "Name and Org",
              "displayName": "Name and Org",
              "required": false,
              "defaultMatch": false,
              "canBeUsedToMatch": true,
              "display": true,
              "type": "string",
              "readOnly": true,
              "removed": true
            },
            {
              "id": "Name",
              "displayName": "Name",
              "required": false,
              "defaultMatch": false,
              "canBeUsedToMatch": true,
              "display": true,
              "type": "string",
              "readOnly": false,
              "removed": false
            },
            {
              "id": "Email",
              "displayName": "Email",
              "required": false,
              "defaultMatch": false,
              "canBeUsedToMatch": true,
              "display": true,
              "type": "string",
              "readOnly": false,
              "removed": false
            },
            {
              "id": "Phone",
              "displayName": "Phone",
              "required": false,
              "defaultMatch": false,
              "canBeUsedToMatch": true,
              "display": true,
              "type": "string",
              "readOnly": false,
              "removed": false
            },
            {
              "id": "id",
              "displayName": "id",
              "required": false,
              "defaultMatch": false,
              "canBeUsedToMatch": true,
              "display": true,
              "type": "string",
              "readOnly": true,
              "removed": true
            },
            {
              "id": "Account",
              "displayName": "Account",
              "required": false,
              "defaultMatch": false,
              "canBeUsedToMatch": true,
              "display": true,
              "type": "string",
              "readOnly": false,
              "removed": true
            },
            {
              "id": "Opportunities",
              "displayName": "Opportunities",
              "required": false,
              "defaultMatch": false,
              "canBeUsedToMatch": true,
              "display": true,
              "type": "array",
              "readOnly": false,
              "removed": true
            },
            {
              "id": "LinkedIn",
              "displayName": "LinkedIn",
              "required": false,
              "defaultMatch": false,
              "canBeUsedToMatch": true,
              "display": true,
              "type": "string",
              "readOnly": false,
              "removed": true
            }
          ],
          "attemptToConvertTypes": false,
          "convertFieldsToString": false
        },
        "options": {}
      },
      "type": "n8n-nodes-base.airtableTool",
      "typeVersion": 2.1,
      "position": [
        -1000,
        200
      ],
      "id": "ebac8ab6-bc41-45c9-be50-3c73a94b4620",
      "name": "create_contact",
      "credentials": {
        "airtableTokenApi": {
          "id": "oFWi9c8fpUUAVcKu",
          "name": "BenAI & Cobuild "
        }
      }
    },
    {
      "parameters": {
        "operation": "update",
        "base": {
          "__rl": true,
          "value": "appmZHna96JsKNeJL",
          "mode": "list",
          "cachedResultName": "n8n Sales Agent (BenAI)",
          "cachedResultUrl": "https://airtable.com/appmZHna96JsKNeJL"
        },
        "table": {
          "__rl": true,
          "value": "tblIWVK0K0l5x8MD4",
          "mode": "list",
          "cachedResultName": "Contacts",
          "cachedResultUrl": "https://airtable.com/appmZHna96JsKNeJL/tblIWVK0K0l5x8MD4"
        },
        "columns": {
          "mappingMode": "defineBelow",
          "value": {
            "Name": "={{ /*n8n-auto-generated-fromAI-override*/ $fromAI('Name', ``, 'string') }}",
            "Email": "={{ /*n8n-auto-generated-fromAI-override*/ $fromAI('Email', ``, 'string') }}",
            "Phone": "={{ /*n8n-auto-generated-fromAI-override*/ $fromAI('Phone', ``, 'string') }}",
            "id": "={{ /*n8n-auto-generated-fromAI-override*/ $fromAI('id__using_to_match_', ``, 'string') }}"
          },
          "matchingColumns": [
            "id"
          ],
          "schema": [
            {
              "id": "Name and Org",
              "displayName": "Name and Org",
              "required": false,
              "defaultMatch": false,
              "canBeUsedToMatch": true,
              "display": true,
              "type": "string",
              "readOnly": true,
              "removed": true
            },
            {
              "id": "Name",
              "displayName": "Name",
              "required": false,
              "defaultMatch": false,
              "canBeUsedToMatch": true,
              "display": true,
              "type": "string",
              "readOnly": false,
              "removed": false
            },
            {
              "id": "Email",
              "displayName": "Email",
              "required": false,
              "defaultMatch": false,
              "canBeUsedToMatch": true,
              "display": true,
              "type": "string",
              "readOnly": false,
              "removed": false
            },
            {
              "id": "Phone",
              "displayName": "Phone",
              "required": false,
              "defaultMatch": false,
              "canBeUsedToMatch": true,
              "display": true,
              "type": "string",
              "readOnly": false,
              "removed": false
            },
            {
              "id": "id",
              "displayName": "id",
              "required": false,
              "defaultMatch": false,
              "canBeUsedToMatch": true,
              "display": true,
              "type": "string",
              "readOnly": true,
              "removed": false
            },
            {
              "id": "Account",
              "displayName": "Account",
              "required": false,
              "defaultMatch": false,
              "canBeUsedToMatch": true,
              "display": true,
              "type": "string",
              "readOnly": false,
              "removed": true
            },
            {
              "id": "Opportunities",
              "displayName": "Opportunities",
              "required": false,
              "defaultMatch": false,
              "canBeUsedToMatch": true,
              "display": true,
              "type": "array",
              "readOnly": false,
              "removed": true
            },
            {
              "id": "LinkedIn",
              "displayName": "LinkedIn",
              "required": false,
              "defaultMatch": false,
              "canBeUsedToMatch": true,
              "display": true,
              "type": "string",
              "readOnly": false,
              "removed": true
            }
          ],
          "attemptToConvertTypes": false,
          "convertFieldsToString": false
        },
        "options": {}
      },
      "type": "n8n-nodes-base.airtableTool",
      "typeVersion": 2.1,
      "position": [
        -860,
        200
      ],
      "id": "9aabc2e7-75e1-4bf2-803d-c984e1c776bc",
      "name": "update_contact",
      "credentials": {
        "airtableTokenApi": {
          "id": "oFWi9c8fpUUAVcKu",
          "name": "BenAI & Cobuild "
        }
      }
    }
  ],
  "pinData": {
    "When Executed by Another Workflow": [
      {
        "json": {
          "query": "Create or update contact for Ben with email Ben@Ben.com and record interest in Ceramic Coating for appearance enhancement."
        }
      }
    ]
  },
  "connections": {
    "When Executed by Another Workflow": {
      "main": [
        [
          {
            "node": "CRM Assistant",
            "type": "main",
            "index": 0
          }
        ]
      ]
    },
    "get_schema": {
      "ai_tool": [
        [
          {
            "node": "CRM Assistant",
            "type": "ai_tool",
            "index": 0
          }
        ]
      ]
    },
    "CRM Assistant": {
      "main": [
        [
          {
            "node": "Response",
            "type": "main",
            "index": 0
          }
        ],
        [
          {
            "node": "Try Again",
            "type": "main",
            "index": 0
          }
        ]
      ]
    },
    "list_records": {
      "ai_tool": [
        [
          {
            "node": "CRM Assistant",
            "type": "ai_tool",
            "index": 0
          }
        ]
      ]
    },
    "Window Buffer Memory": {
      "ai_memory": [
        [
          {
            "node": "CRM Assistant",
            "type": "ai_memory",
            "index": 0
          }
        ]
      ]
    },
    "create_opportunity": {
      "ai_tool": [
        [
          {
            "node": "CRM Assistant",
            "type": "ai_tool",
            "index": 0
          }
        ]
      ]
    },
    "update_opportunity": {
      "ai_tool": [
        [
          {
            "node": "CRM Assistant",
            "type": "ai_tool",
            "index": 0
          }
        ]
      ]
    },
    "OpenAI Chat Model": {
      "ai_languageModel": [
        [
          {
            "node": "CRM Assistant",
            "type": "ai_languageModel",
            "index": 0
          }
        ]
      ]
    },
    "create_contact": {
      "ai_tool": [
        [
          {
            "node": "CRM Assistant",
            "type": "ai_tool",
            "index": 0
          }
        ]
      ]
    },
    "update_contact": {
      "ai_tool": [
        [
          {
            "node": "CRM Assistant",
            "type": "ai_tool",
            "index": 0
          }
        ]
      ]
    }
  },
  "active": false,
  "settings": {
    "executionOrder": "v1"
  },
  "versionId": "a237779d-c913-488f-9a90-14f5cdcaface",
  "meta": {
    "templateCredsSetupCompleted": true,
    "instanceId": "a226ccd2b47f2505e743dd72896ae1c385e1d543b95f0badc72e1ad42c93a962"
  },
  "id": "PvSEhvcleGcP7XF2",
  "tags": []
}
EOF
