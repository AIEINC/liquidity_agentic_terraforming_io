#!/bin/bash
# Auto-generated launcher for Integration Webhooks, Stripe
echo "Running agent: Integration Webhooks, Stripe"
cat <<EOF
{
  "name": "Integration Webhooks, Stripe",
  "flow": [
    {
      "id": 1,
      "module": "gateway:CustomWebHook",
      "version": 1,
      "parameters": {
        "hook": 2006237,
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
      "id": 3,
      "module": "stripe:createCustomer",
      "version": 1,
      "parameters": {
        "__IMTCONN__": 3851487
      },
      "mapper": {
        "name": "{{1.Name}}",
        "email": "{{1.email}}",
        "phone": "",
        "coupon": "",
        "source": "",
        "address": {
          "city": "",
          "line1": "",
          "line2": "",
          "state": "",
          "country": "",
          "postal_code": ""
        },
        "balance": "",
        "metadata": [],
        "shipping": {
          "name": "",
          "phone": "",
          "address": {
            "city": "",
            "line1": "",
            "line2": "",
            "state": "",
            "country": "",
            "postal_code": ""
          }
        },
        "tax_exempt": "",
        "description": "",
        "tax_id_data": [],
        "invoice_prefix": "",
        "payment_method": "",
        "promotion_code": "",
        "invoice_settings": {
          "footer": "",
          "custom_fields": [],
          "default_payment_method": ""
        },
        "preferred_locales": [],
        "next_invoice_sequence": ""
      },
      "metadata": {
        "designer": {
          "x": 338,
          "y": -3
        },
        "restore": {
          "expect": {
            "coupon": {
              "mode": "edit"
            },
            "metadata": {
              "mode": "chose"
            },
            "tax_exempt": {
              "label": "Empty"
            },
            "promotion_code": {
              "mode": "edit"
            },
            "invoice_settings": {
              "nested": {
                "custom_fields": {
                  "mode": "chose"
                }
              }
            }
          },
          "parameters": {
            "__IMTCONN__": {
              "data": {
                "scoped": "true",
                "connection": "stripe"
              },
              "label": "My Stripe API Key connection"
            }
          }
        },
        "parameters": [
          {
            "name": "__IMTCONN__",
            "type": "account:stripe,stripe2",
            "label": "Connection",
            "required": true
          }
        ],
        "expect": [
          {
            "name": "description",
            "type": "text",
            "label": "Description"
          },
          {
            "name": "email",
            "type": "email",
            "label": "Email"
          },
          {
            "name": "name",
            "type": "text",
            "label": "Name"
          },
          {
            "name": "phone",
            "type": "text",
            "label": "Phone"
          },
          {
            "name": "address",
            "spec": [
              {
                "name": "line1",
                "type": "text",
                "label": "Line 1"
              },
              {
                "name": "line2",
                "type": "text",
                "label": "Line 2"
              },
              {
                "name": "city",
                "type": "text",
                "label": "City"
              },
              {
                "name": "country",
                "type": "text",
                "label": "Country"
              },
              {
                "name": "postal_code",
                "type": "text",
                "label": "Postal code"
              },
              {
                "name": "state",
                "type": "text",
                "label": "State"
              }
            ],
            "type": "collection",
            "label": "Address"
          },
          {
            "name": "shipping",
            "spec": [
              {
                "name": "address",
                "spec": [
                  {
                    "name": "line1",
                    "type": "text",
                    "label": "Line 1"
                  },
                  {
                    "name": "line2",
                    "type": "text",
                    "label": "Line 2"
                  },
                  {
                    "name": "city",
                    "type": "text",
                    "label": "City"
                  },
                  {
                    "name": "country",
                    "type": "text",
                    "label": "Country"
                  },
                  {
                    "name": "postal_code",
                    "type": "text",
                    "label": "Postal code"
                  },
                  {
                    "name": "state",
                    "type": "text",
                    "label": "State"
                  }
                ],
                "type": "collection",
                "label": "Address"
              },
              {
                "name": "name",
                "type": "text",
                "label": "Name"
              },
              {
                "name": "phone",
                "type": "text",
                "label": "Phone"
              }
            ],
            "type": "collection",
            "label": "Shipping"
          },
          {
            "name": "payment_method",
            "type": "text",
            "label": "Payment Method ID"
          },
          {
            "name": "metadata",
            "spec": [
              {
                "name": "key",
                "type": "text",
                "label": "Key",
                "required": true,
                "validate": {
                  "max": 40
                }
              },
              {
                "name": "value",
                "type": "text",
                "label": "Value",
                "required": true,
                "validate": {
                  "max": 500
                }
              }
            ],
            "type": "array",
            "label": "Metadata",
            "validate": {
              "maxItems": 50
            }
          },
          {
            "name": "balance",
            "type": "integer",
            "label": "Balance"
          },
          {
            "mode": "edit",
            "name": "coupon",
            "type": "select",
            "label": "Coupon ID"
          },
          {
            "name": "invoice_prefix",
            "type": "text",
            "label": "Invoice Prefix",
            "validate": {
              "max": 12,
              "min": 3
            }
          },
          {
            "name": "invoice_settings",
            "spec": [
              {
                "name": "custom_fields",
                "spec": [
                  {
                    "name": "name",
                    "type": "text",
                    "label": "Name",
                    "required": true,
                    "validate": {
                      "max": 30
                    }
                  },
                  {
                    "name": "value",
                    "type": "text",
                    "label": "Value",
                    "required": true,
                    "validate": {
                      "max": 30
                    }
                  }
                ],
                "type": "array",
                "label": "Custom Fields"
              },
              {
                "name": "default_payment_method",
                "type": "text",
                "label": "Default Payment Method ID"
              },
              {
                "name": "footer",
                "type": "text",
                "label": "Footer"
              }
            ],
            "type": "collection",
            "label": "Invoice Settings"
          },
          {
            "name": "next_invoice_sequence",
            "type": "uinteger",
            "label": "Next Invoice Sequence"
          },
          {
            "name": "preferred_locales",
            "spec": {
              "name": "value",
              "type": "select",
              "label": "Locale",
              "options": [
                {
                  "label": "Arabic",
                  "value": "ar"
                },
                {
                  "label": "Bulgarian (Bulgaria)",
                  "value": "bg"
                },
                {
                  "label": "Czech (Czech Republic)",
                  "value": "cs"
                },
                {
                  "label": "Danish",
                  "value": "da"
                },
                {
                  "label": "German (Germany)",
                  "value": "de"
                },
                {
                  "label": "Greek (Greece)",
                  "value": "el"
                },
                {
                  "label": "English",
                  "value": "en"
                },
                {
                  "label": "English (United Kingdom)",
                  "value": "en-GB"
                },
                {
                  "label": "Spanish (Spain)",
                  "value": "es"
                },
                {
                  "label": "Spanish (Latin America)",
                  "value": "es-419"
                },
                {
                  "label": "Estonian (Estonia)",
                  "value": "et"
                },
                {
                  "label": "Finnish (Finland)",
                  "value": "fi"
                },
                {
                  "label": "French (France)",
                  "value": "fr"
                },
                {
                  "label": "French (Canada)",
                  "value": "fr-CA"
                },
                {
                  "label": "Hebrew (Israel)",
                  "value": "he"
                },
                {
                  "label": "Hungarian (Hungary)",
                  "value": "hu"
                },
                {
                  "label": "Indonesian (Indonesia)",
                  "value": "id"
                },
                {
                  "label": "Italian (Italy)",
                  "value": "it"
                },
                {
                  "label": "Japanese",
                  "value": "ja"
                },
                {
                  "label": "Lithuanian (Lithuania)",
                  "value": "lt"
                },
                {
                  "label": "Latvian (Latvia)",
                  "value": "lv"
                },
                {
                  "label": "Malay (Malaysia)",
                  "value": "ms"
                },
                {
                  "label": "Maltese (Malta)",
                  "value": "mt"
                },
                {
                  "label": "Norwegian Bokm\u00e5l",
                  "value": "nb"
                },
                {
                  "label": "Dutch (Netherlands)",
                  "value": "nl"
                },
                {
                  "label": "Polish (Poland)",
                  "value": "pl"
                },
                {
                  "label": "Portuguese (Brazil)",
                  "value": "pt-BR"
                },
                {
                  "label": "Portuguese (Brazil)",
                  "value": "pt"
                },
                {
                  "label": "Romanian (Romania)",
                  "value": "ro"
                },
                {
                  "label": "Russian (Russia)",
                  "value": "ru"
                },
                {
                  "label": "Slovak (Slovakia)",
                  "value": "sk"
                },
                {
                  "label": "Slovenian (Slovenia)",
                  "value": "sl"
                },
                {
                  "label": "Swedish (Sweden)",
                  "value": "sv"
                },
                {
                  "label": "Turkish (Turkey)",
                  "value": "tr"
                },
                {
                  "label": "Chinese Simplified (China)",
                  "value": "zh"
                },
                {
                  "label": "Chinese Traditional (Hong Kong)",
                  "value": "zh-HK"
                },
                {
                  "label": "Chinese Traditional (Taiwan)",
                  "value": "zh-TW"
                }
              ],
              "required": true
            },
            "type": "array",
            "label": "Preferred Locales"
          },
          {
            "mode": "edit",
            "name": "promotion_code",
            "type": "select",
            "label": "Promotion Code ID"
          },
          {
            "name": "source",
            "type": "text",
            "label": "Source ID"
          },
          {
            "name": "tax_exempt",
            "type": "select",
            "label": "Tax Exempt",
            "validate": {
              "enum": [
                "none",
                "exempt",
                "reverse"
              ]
            }
          },
          {
            "name": "tax_id_data",
            "spec": [
              {
                "name": "type",
                "type": "select",
                "label": "Type",
                "dynamic": true,
                "options": [
                  {
                    "label": "AE - TRN",
                    "value": "ae_trn"
                  },
                  {
                    "label": "AU - ABN",
                    "value": "au_abn"
                  },
                  {
                    "label": "AU - ARN",
                    "value": "au_arn"
                  },
                  {
                    "label": "BR - CNPJ",
                    "value": "br_cnpj"
                  },
                  {
                    "label": "BR - CPF",
                    "value": "br_cpf"
                  },
                  {
                    "label": "CA - BN",
                    "value": "ca_bn"
                  },
                  {
                    "label": "CA - GST/HST",
                    "value": "ca_gst_hst"
                  },
                  {
                    "label": "CA - PST (British Columbia)",
                    "value": "ca_pst_bc"
                  },
                  {
                    "label": "CA - PST (Manitoba)",
                    "value": "ca_pst_mb"
                  },
                  {
                    "label": "CA - PST (Saskatchewan)",
                    "value": "ca_pst_sk"
                  },
                  {
                    "label": "CA - QST",
                    "value": "ca_qst"
                  },
                  {
                    "label": "CH - VAT",
                    "value": "ch_vat"
                  },
                  {
                    "label": "CL - TIN",
                    "value": "cl_tin"
                  },
                  {
                    "label": "ES - CIF",
                    "value": "es_cif"
                  },
                  {
                    "label": "EU - VAT",
                    "value": "eu_vat"
                  },
                  {
                    "label": "UK - VAT",
                    "value": "gb_vat"
                  },
                  {
                    "label": "GE - VAT",
                    "value": "ge_vat"
                  },
                  {
                    "label": "HK - BR",
                    "value": "hk_br"
                  },
                  {
                    "label": "ID - NPWP",
                    "value": "id_npwp"
                  },
                  {
                    "label": "IL - VAT",
                    "value": "il_vat"
                  },
                  {
                    "label": "IN - GST",
                    "value": "in_gst"
                  },
                  {
                    "label": "JP - CN",
                    "value": "jp_cn"
                  },
                  {
                    "label": "JP - RN",
                    "value": "jp_rn"
                  },
                  {
                    "label": "KR - BRN",
                    "value": "kr_brn"
                  },
                  {
                    "label": "LI - UID",
                    "value": "li_uid"
                  },
                  {
                    "label": "MX - RFC",
                    "value": "mx_rfc"
                  },
                  {
                    "label": "MY - FRP",
                    "value": "my_frp"
                  },
                  {
                    "label": "MY - ITN",
                    "value": "my_itn"
                  },
                  {
                    "label": "MY - SST",
                    "value": "my_sst"
                  },
                  {
                    "label": "NO - VAT",
                    "value": "no_vat"
                  },
                  {
                    "label": "NZ - GST",
                    "value": "nz_gst"
                  },
                  {
                    "label": "RU - INN",
                    "value": "ru_inn"
                  },
                  {
                    "label": "RU - KPP",
                    "value": "ru_kpp"
                  },
                  {
                    "label": "SA - VAT",
                    "value": "sa_vat"
                  },
                  {
                    "label": "SG - GST",
                    "value": "sg_gst"
                  },
                  {
                    "label": "SG - UEN",
                    "value": "sg_uen"
                  },
                  {
                    "label": "TH - VAT",
                    "value": "th_vat"
                  },
                  {
                    "label": "TW - VAT",
                    "value": "tw_vat"
                  },
                  {
                    "label": "UA - VAT",
                    "value": "ua_vat"
                  },
                  {
                    "label": "US - EIN",
                    "value": "us_ein"
                  },
                  {
                    "label": "ZA - VAT",
                    "value": "za_vat"
                  }
                ],
                "required": true
              },
              {
                "name": "value",
                "type": "text",
                "label": "Tax ID",
                "required": true
              }
            ],
            "type": "array",
            "label": "TAX ID Data"
          }
        ]
      }
    },
    {
      "id": 4,
      "module": "stripe:createInvoiceItem",
      "version": 1,
      "parameters": {
        "__IMTCONN__": 3851487
      },
      "mapper": {
        "amount": "{{1.price}}00",
        "period": {
          "end": "",
          "start": ""
        },
        "invoice": "",
        "currency": "usd",
        "customer": "{{3.id}}",
        "metadata": [],
        "tax_rates": [],
        "description": "",
        "input_amount": "total",
        "subscription": ""
      },
      "metadata": {
        "designer": {
          "x": 638,
          "y": -14
        },
        "restore": {
          "expect": {
            "input_amount": {
              "label": "By a Total Amount"
            }
          },
          "parameters": {
            "__IMTCONN__": {
              "data": {
                "scoped": "true",
                "connection": "stripe"
              },
              "label": "My Stripe API Key connection"
            }
          }
        },
        "parameters": [
          {
            "name": "__IMTCONN__",
            "type": "account:stripe,stripe2",
            "label": "Connection",
            "required": true
          }
        ],
        "expect": [
          {
            "name": "customer",
            "type": "text",
            "label": "Customer ID",
            "required": true
          },
          {
            "name": "input_amount",
            "type": "select",
            "label": "Input an Amount",
            "required": true,
            "validate": {
              "enum": [
                "total",
                "unit_amount",
                "price"
              ]
            }
          },
          {
            "name": "description",
            "type": "text",
            "label": "Description"
          },
          {
            "name": "period",
            "spec": [
              {
                "name": "start",
                "type": "date",
                "label": "Start"
              },
              {
                "name": "end",
                "type": "date",
                "label": "End"
              }
            ],
            "type": "collection",
            "label": "Period"
          },
          {
            "name": "metadata",
            "spec": [
              {
                "name": "key",
                "type": "text",
                "label": "Key",
                "required": true
              },
              {
                "name": "value",
                "type": "text",
                "label": "Value"
              }
            ],
            "type": "array",
            "label": "Metadata"
          },
          {
            "name": "discountable",
            "type": "boolean",
            "label": "Discountable"
          },
          {
            "name": "invoice",
            "type": "text",
            "label": "Invoice ID"
          },
          {
            "name": "subscription",
            "type": "text",
            "label": "Subscription ID"
          },
          {
            "name": "tax_rates",
            "spec": {
              "name": "value",
              "type": "select",
              "label": "Tax Rate",
              "dynamic": true,
              "options": [],
              "required": true
            },
            "type": "array",
            "label": "Tax Rates"
          },
          {
            "name": "amount",
            "type": "integer",
            "label": "Amount",
            "required": true
          },
          {
            "name": "currency",
            "type": "text",
            "label": "Currency"
          }
        ]
      }
    },
    {
      "id": 5,
      "module": "stripe:createInvoice",
      "version": 1,
      "parameters": {
        "__IMTCONN__": 3851487
      },
      "mapper": {
        "footer": "",
        "customer": "{{3.id}}",
        "due_date": "",
        "metadata": [],
        "discounts": [],
        "description": "",
        "auto_advance": false,
        "subscription": "",
        "custom_fields": [],
        "transfer_data": {
          "amount": ""
        },
        "days_until_due": "14",
        "default_source": "",
        "collection_method": "send_invoice",
        "default_tax_rates": [],
        "statement_descriptor": "",
        "application_fee_amount": "",
        "default_payment_method": "",
        "pending_invoice_items_behavior": "include"
      },
      "metadata": {
        "designer": {
          "x": 938,
          "y": -14
        },
        "restore": {
          "expect": {
            "transfer_data": {
              "nested": {
                "destination": {
                  "mode": "chose"
                }
              }
            },
            "collection_method": {
              "label": "Send Invoice"
            },
            "pending_invoice_items_behavior": {
              "label": "Include"
            }
          },
          "parameters": {
            "__IMTCONN__": {
              "data": {
                "scoped": "true",
                "connection": "stripe"
              },
              "label": "My Stripe API Key connection"
            }
          }
        },
        "parameters": [
          {
            "name": "__IMTCONN__",
            "type": "account:stripe,stripe2",
            "label": "Connection",
            "required": true
          }
        ],
        "expect": [
          {
            "name": "customer",
            "type": "text",
            "label": "Customer ID",
            "required": true
          },
          {
            "name": "auto_advance",
            "type": "boolean",
            "label": "Auto Advance",
            "required": true
          },
          {
            "name": "collection_method",
            "type": "select",
            "label": "Collection Method",
            "required": true,
            "validate": {
              "enum": [
                "charge_automatically",
                "send_invoice"
              ]
            }
          },
          {
            "name": "description",
            "type": "text",
            "label": "Description"
          },
          {
            "name": "subscription",
            "type": "text",
            "label": "Subscription ID"
          },
          {
            "name": "pending_invoice_items_behavior",
            "type": "select",
            "label": "Pending Invoice Items Behavior",
            "validate": {
              "enum": [
                "exclude",
                "include"
              ]
            }
          },
          {
            "name": "metadata",
            "spec": [
              {
                "name": "key",
                "type": "text",
                "label": "Key",
                "required": true
              },
              {
                "name": "value",
                "type": "text",
                "label": "Value"
              }
            ],
            "type": "array",
            "label": "Metadata"
          },
          {
            "name": "application_fee_amount",
            "type": "uinteger",
            "label": "Application Fee Amount"
          },
          {
            "name": "custom_fields",
            "spec": [
              {
                "name": "name",
                "type": "text",
                "label": "Name",
                "required": true
              },
              {
                "name": "value",
                "type": "text",
                "label": "Value"
              }
            ],
            "type": "array",
            "label": "Custom Fields",
            "validate": {
              "maxItems": 4
            }
          },
          {
            "name": "default_payment_method",
            "type": "text",
            "label": "Default Payment Method ID"
          },
          {
            "name": "default_source",
            "type": "text",
            "label": "Default Payment Source ID"
          },
          {
            "name": "default_tax_rates",
            "spec": {
              "name": "value",
              "type": "select",
              "label": "ID",
              "dynamic": true,
              "options": []
            },
            "type": "array",
            "label": "Default Tax Rates ID"
          },
          {
            "name": "discounts",
            "spec": [
              {
                "name": "coupon",
                "type": "select",
                "label": "Coupon ID",
                "dynamic": true,
                "options": []
              },
              {
                "name": "discount",
                "type": "text",
                "label": "Discount ID"
              }
            ],
            "type": "array",
            "label": "Discounts"
          },
          {
            "name": "footer",
            "type": "text",
            "label": "Footer"
          },
          {
            "name": "statement_descriptor",
            "type": "text",
            "label": "Statement Descriptor"
          },
          {
            "name": "transfer_data",
            "spec": [
              {
                "name": "destination",
                "type": "select",
                "label": "Destination"
              },
              {
                "name": "amount",
                "type": "uinteger",
                "label": "Amount"
              }
            ],
            "type": "collection",
            "label": "Transfer Data"
          },
          {
            "name": "days_until_due",
            "type": "uinteger",
            "label": "Days Until Due"
          },
          {
            "name": "due_date",
            "type": "date",
            "label": "Due Date"
          }
        ]
      }
    },
    {
      "id": 7,
      "module": "stripe:finalizeInvoice",
      "version": 1,
      "parameters": {
        "__IMTCONN__": 3851487
      },
      "mapper": {
        "invoice": "{{5.id}}"
      },
      "metadata": {
        "designer": {
          "x": 1241,
          "y": -20
        },
        "restore": {
          "parameters": {
            "__IMTCONN__": {
              "data": {
                "scoped": "true",
                "connection": "stripe"
              },
              "label": "My Stripe API Key connection"
            }
          }
        },
        "parameters": [
          {
            "name": "__IMTCONN__",
            "type": "account:stripe,stripe2",
            "label": "Connection",
            "required": true
          }
        ],
        "expect": [
          {
            "name": "invoice",
            "type": "text",
            "label": "Invoice ID",
            "required": true
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
        "body": "{{7.hosted_invoice_url}}",
        "status": "200",
        "headers": []
      },
      "metadata": {
        "designer": {
          "x": 1538,
          "y": -21
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
    "zone": "us1.make.com",
    "notes": []
  }
}
EOF
