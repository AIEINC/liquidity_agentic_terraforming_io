#!/bin/bash
# Auto-generated launcher for Find flight options
echo "Running agent: Find flight options"
cat <<EOF
{
  "name": "Find flight options",
  "flow": [
    {
      "id": 3,
      "module": "gateway:CustomWebHook",
      "version": 1,
      "parameters": {
        "hook": 1920905,
        "maxResults": 1
      },
      "mapper": {},
      "metadata": {
        "designer": {
          "x": -306,
          "y": -170
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
      "id": 11,
      "module": "builtin:BasicRouter",
      "version": 1,
      "mapper": null,
      "metadata": {
        "designer": {
          "x": -10,
          "y": -173
        }
      },
      "routes": [
        {
          "flow": [
            {
              "id": 8,
              "module": "serpapi:SearchGoogleFlights",
              "version": 1,
              "parameters": {
                "__IMTCONN__": 3714461
              },
              "filter": {
                "name": "Airline not defined I 1 way",
                "conditions": [
                  [
                    {
                      "a": "{{3.`Airline Code`}}",
                      "b": "undefined",
                      "o": "text:equal"
                    },
                    {
                      "a": "{{3.`Arrival Date`}}",
                      "b": "undefined",
                      "o": "text:equal"
                    }
                  ]
                ]
              },
              "mapper": {
                "gl": "nl",
                "type": "2",
                "arrival_id": "{{3.`Arrival Airport`}}",
                "departure_id": "{{3.`Departure Airport`}}",
                "travel_class": "{{3.`Flight Class`}}",
                "outbound_date": "{{3.`Departure Date`}}"
              },
              "metadata": {
                "designer": {
                  "x": 456,
                  "y": -249
                },
                "restore": {
                  "expect": {
                    "gl": {
                      "mode": "edit"
                    },
                    "hl": {
                      "mode": "chose",
                      "label": "Empty"
                    },
                    "type": {
                      "mode": "chose",
                      "label": "One way - 2"
                    },
                    "stops": {
                      "mode": "chose",
                      "label": "Empty"
                    },
                    "currency": {
                      "mode": "chose",
                      "label": "Empty"
                    },
                    "no_cache": {
                      "mode": "chose"
                    },
                    "emissions": {
                      "mode": "chose",
                      "label": "Empty"
                    },
                    "show_hidden": {
                      "mode": "chose"
                    },
                    "travel_class": {
                      "mode": "edit"
                    }
                  },
                  "parameters": {
                    "__IMTCONN__": {
                      "data": {
                        "scoped": "true",
                        "connection": "serpapi"
                      },
                      "label": "My SerpApi connection (ben@forcefactory-ai.com)"
                    }
                  }
                },
                "parameters": [
                  {
                    "name": "__IMTCONN__",
                    "type": "account:serpapi",
                    "label": "Connection",
                    "required": true
                  }
                ],
                "expect": [
                  {
                    "name": "departure_id",
                    "type": "text",
                    "label": "`departure_id` Departure airport code / location kgmid",
                    "required": true
                  },
                  {
                    "name": "arrival_id",
                    "type": "text",
                    "label": "`arrival_id` Arrival airport code / location kgmid",
                    "required": true
                  },
                  {
                    "name": "outbound_date",
                    "type": "text",
                    "label": "`outbound_date` Outbound Date",
                    "required": true
                  },
                  {
                    "name": "return_date",
                    "type": "text",
                    "label": "`return_date` Return Date"
                  },
                  {
                    "name": "gl",
                    "type": "select",
                    "label": "`gl` Country",
                    "validate": {
                      "enum": [
                        "af",
                        "al",
                        "dz",
                        "as",
                        "ad",
                        "ao",
                        "ai",
                        "aq",
                        "ag",
                        "ar",
                        "am",
                        "aw",
                        "au",
                        "at",
                        "az",
                        "bs",
                        "bh",
                        "bd",
                        "bb",
                        "by",
                        "be",
                        "bz",
                        "bj",
                        "bm",
                        "bt",
                        "bo",
                        "ba",
                        "bw",
                        "bv",
                        "br",
                        "io",
                        "bn",
                        "bg",
                        "bf",
                        "bi",
                        "kh",
                        "cm",
                        "ca",
                        "cv",
                        "ky",
                        "cf",
                        "td",
                        "cl",
                        "cn",
                        "cx",
                        "cc",
                        "co",
                        "km",
                        "cg",
                        "cd",
                        "ck",
                        "cr",
                        "ci",
                        "hr",
                        "cu",
                        "cy",
                        "cz",
                        "dk",
                        "dj",
                        "dm",
                        "do",
                        "ec",
                        "eg",
                        "sv",
                        "gq",
                        "er",
                        "ee",
                        "et",
                        "fk",
                        "fo",
                        "fj",
                        "fi",
                        "fr",
                        "gf",
                        "pf",
                        "tf",
                        "ga",
                        "gm",
                        "ge",
                        "de",
                        "gh",
                        "gi",
                        "gr",
                        "gl",
                        "gd",
                        "gp",
                        "gu",
                        "gt",
                        "gn",
                        "gw",
                        "gy",
                        "ht",
                        "hm",
                        "va",
                        "hn",
                        "hk",
                        "hu",
                        "is",
                        "in",
                        "id",
                        "ir",
                        "iq",
                        "ie",
                        "il",
                        "it",
                        "jm",
                        "jp",
                        "jo",
                        "kz",
                        "ke",
                        "ki",
                        "kp",
                        "kr",
                        "kw",
                        "kg",
                        "la",
                        "lv",
                        "lb",
                        "ls",
                        "lr",
                        "ly",
                        "li",
                        "lt",
                        "lu",
                        "mo",
                        "mk",
                        "mg",
                        "mw",
                        "my",
                        "mv",
                        "ml",
                        "mt",
                        "mh",
                        "mq",
                        "mr",
                        "mu",
                        "yt",
                        "mx",
                        "fm",
                        "md",
                        "mc",
                        "mn",
                        "ms",
                        "ma",
                        "mz",
                        "mm",
                        "na",
                        "nr",
                        "np",
                        "nl",
                        "an",
                        "nc",
                        "nz",
                        "ni",
                        "ne",
                        "ng",
                        "nu",
                        "nf",
                        "mp",
                        "no",
                        "om",
                        "pk",
                        "pw",
                        "ps",
                        "pa",
                        "pg",
                        "py",
                        "pe",
                        "ph",
                        "pn",
                        "pl",
                        "pt",
                        "pr",
                        "qa",
                        "re",
                        "ro",
                        "ru",
                        "rw",
                        "sh",
                        "kn",
                        "lc",
                        "pm",
                        "vc",
                        "ws",
                        "sm",
                        "st",
                        "sa",
                        "sn",
                        "rs",
                        "sc",
                        "sl",
                        "sg",
                        "sk",
                        "si",
                        "sb",
                        "so",
                        "za",
                        "gs",
                        "es",
                        "lk",
                        "sd",
                        "sr",
                        "sj",
                        "sz",
                        "se",
                        "ch",
                        "sy",
                        "tw",
                        "tj",
                        "tz",
                        "th",
                        "tl",
                        "tg",
                        "tk",
                        "to",
                        "tt",
                        "tn",
                        "tr",
                        "tm",
                        "tc",
                        "tv",
                        "ug",
                        "ua",
                        "ae",
                        "uk",
                        "gb",
                        "us",
                        "um",
                        "uy",
                        "uz",
                        "vu",
                        "ve",
                        "vn",
                        "vg",
                        "vi",
                        "wf",
                        "eh",
                        "ye",
                        "zm",
                        "zw"
                      ]
                    }
                  },
                  {
                    "name": "hl",
                    "type": "select",
                    "label": "`hl` Language",
                    "validate": {
                      "enum": [
                        "af",
                        "ak",
                        "sq",
                        "ws",
                        "am",
                        "ar",
                        "hy",
                        "az",
                        "eu",
                        "be",
                        "bem",
                        "bn",
                        "bh",
                        "xx-bork",
                        "bs",
                        "br",
                        "bg",
                        "bt",
                        "km",
                        "ca",
                        "chr",
                        "ny",
                        "zh-cn",
                        "zh-tw",
                        "co",
                        "hr",
                        "cs",
                        "da",
                        "nl",
                        "xx-elmer",
                        "en",
                        "eo",
                        "et",
                        "ee",
                        "fo",
                        "tl",
                        "fi",
                        "fr",
                        "fy",
                        "gaa",
                        "gl",
                        "ka",
                        "de",
                        "el",
                        "kl",
                        "gn",
                        "gu",
                        "xx-hacker",
                        "ht",
                        "ha",
                        "haw",
                        "iw",
                        "hi",
                        "hu",
                        "is",
                        "ig",
                        "id",
                        "ia",
                        "ga",
                        "it",
                        "ja",
                        "jw",
                        "kn",
                        "kk",
                        "rw",
                        "rn",
                        "xx-klingon",
                        "kg",
                        "ko",
                        "kri",
                        "ku",
                        "ckb",
                        "ky",
                        "lo",
                        "la",
                        "lv",
                        "ln",
                        "lt",
                        "loz",
                        "lg",
                        "ach",
                        "mk",
                        "mg",
                        "ms",
                        "ml",
                        "mt",
                        "mv",
                        "mi",
                        "mr",
                        "mfe",
                        "mo",
                        "mn",
                        "sr-me",
                        "my",
                        "ne",
                        "pcm",
                        "nso",
                        "no",
                        "nn",
                        "oc",
                        "or",
                        "om",
                        "ps",
                        "fa",
                        "xx-pirate",
                        "pl",
                        "pt",
                        "pt-br",
                        "pt-pt",
                        "pa",
                        "qu",
                        "ro",
                        "rm",
                        "nyn",
                        "ru",
                        "gd",
                        "sr",
                        "sh",
                        "st",
                        "tn",
                        "crs",
                        "sn",
                        "sd",
                        "si",
                        "sk",
                        "sl",
                        "so",
                        "es",
                        "es-419",
                        "su",
                        "sw",
                        "sv",
                        "tg",
                        "ta",
                        "tt",
                        "te",
                        "th",
                        "ti",
                        "to",
                        "lua",
                        "tum",
                        "tr",
                        "tk",
                        "tw",
                        "ug",
                        "uk",
                        "ur",
                        "uz",
                        "vu",
                        "vi",
                        "cy",
                        "wo",
                        "xh",
                        "yi",
                        "yo",
                        "zu"
                      ]
                    }
                  },
                  {
                    "name": "currency",
                    "type": "select",
                    "label": "`currency` Currency",
                    "validate": {
                      "enum": [
                        "ALL",
                        "DZD",
                        "ARS",
                        "AMD",
                        "AWG",
                        "AUD",
                        "AZN",
                        "BSD",
                        "BHD",
                        "BYN",
                        "BMD",
                        "BAM",
                        "BRL",
                        "GBP",
                        "BGN",
                        "XPF",
                        "CAD",
                        "CLP",
                        "CNY",
                        "COP",
                        "CRC",
                        "CUP",
                        "CZK",
                        "DKK",
                        "DOP",
                        "EGP",
                        "EUR",
                        "GEL",
                        "HKD",
                        "HUF",
                        "ISK",
                        "INR",
                        "IDR",
                        "IRR",
                        "ILS",
                        "JMD",
                        "JPY",
                        "JOD",
                        "KZT",
                        "KWD",
                        "LBP",
                        "MKD",
                        "MYR",
                        "MXN",
                        "MDL",
                        "MAD",
                        "TWD",
                        "NZD",
                        "NOK",
                        "OMR",
                        "PKR",
                        "PAB",
                        "PEN",
                        "PHP",
                        "PLN",
                        "QAR",
                        "RON",
                        "RUB",
                        "SAR",
                        "RSD",
                        "SGD",
                        "ZAR",
                        "KRW",
                        "SEK",
                        "CHF",
                        "THB",
                        "TRY",
                        "USD",
                        "UAH",
                        "AED",
                        "VND"
                      ]
                    }
                  },
                  {
                    "name": "type",
                    "type": "select",
                    "label": "`type` Flight Type",
                    "validate": {
                      "enum": [
                        "1",
                        "2",
                        "3"
                      ]
                    }
                  },
                  {
                    "name": "travel_class",
                    "type": "select",
                    "label": "`travel_class` Travel Class",
                    "validate": {
                      "enum": [
                        1,
                        2,
                        3,
                        4
                      ]
                    }
                  },
                  {
                    "name": "multi_city_json",
                    "type": "text",
                    "label": "`multi_city_json` Parameters for Multi-city"
                  },
                  {
                    "name": "show_hidden",
                    "type": "boolean",
                    "label": "`show_hidden` Show hidden results"
                  },
                  {
                    "name": "adults",
                    "type": "number",
                    "label": "`adults` Number of Adults"
                  },
                  {
                    "name": "children",
                    "type": "number",
                    "label": "`children` Number of Children"
                  },
                  {
                    "name": "infants_in_seat",
                    "type": "number",
                    "label": "`infants_in_seat` Number of Infants in seat"
                  },
                  {
                    "name": "infants_on_lap",
                    "type": "number",
                    "label": "`infants_on_lap` Number of Infants on lap"
                  },
                  {
                    "name": "stops",
                    "type": "select",
                    "label": "`stops` Stops",
                    "validate": {
                      "enum": [
                        0,
                        1,
                        2,
                        3
                      ]
                    }
                  },
                  {
                    "name": "exclude_airlines",
                    "type": "text",
                    "label": "`exclude_airlines` Exclude airlines"
                  },
                  {
                    "name": "include_airlines",
                    "type": "text",
                    "label": "`include_airlines` Include airlines"
                  },
                  {
                    "name": "bags",
                    "type": "number",
                    "label": "`bags` bags"
                  },
                  {
                    "name": "max_price",
                    "type": "number",
                    "label": "`max_price` Max price"
                  },
                  {
                    "name": "outbound_times",
                    "type": "text",
                    "label": "`outbound_times` Outbound times"
                  },
                  {
                    "name": "return_times",
                    "type": "text",
                    "label": "`return_times` Return times"
                  },
                  {
                    "name": "emissions",
                    "type": "select",
                    "label": "`emissions` Emissions",
                    "validate": {
                      "enum": [
                        1
                      ]
                    }
                  },
                  {
                    "name": "layover_duration",
                    "type": "text",
                    "label": "`layover_duration` Layover duration"
                  },
                  {
                    "name": "exclude_conns",
                    "type": "text",
                    "label": "`exclude_conns` Exclude connecting airports"
                  },
                  {
                    "name": "max_duration",
                    "type": "number",
                    "label": "`max_duration` Max duration"
                  },
                  {
                    "name": "departure_token",
                    "type": "text",
                    "label": "`departure_token` Departure flight token"
                  },
                  {
                    "name": "booking_token",
                    "type": "text",
                    "label": "`booking_token` Booking token"
                  },
                  {
                    "name": "no_cache",
                    "type": "boolean",
                    "label": "`no_cache` Disable Caching"
                  },
                  {
                    "name": "async",
                    "type": "text",
                    "label": "`async` Async"
                  },
                  {
                    "name": "output",
                    "type": "text",
                    "label": "`output` Output"
                  }
                ]
              }
            },
            {
              "id": 9,
              "module": "builtin:BasicAggregator",
              "version": 1,
              "parameters": {
                "feeder": 8
              },
              "mapper": {
                "best_flights": "{{8.best_flights}}",
                "other_flights": "{{8.other_flights}}",
                "price_insights": "{{8.price_insights}}"
              },
              "metadata": {
                "designer": {
                  "x": 723,
                  "y": -250
                },
                "restore": {
                  "extra": {
                    "feeder": {
                      "label": "SerpApi - Search Google Flights [5]"
                    },
                    "target": {
                      "label": "Custom"
                    }
                  }
                }
              }
            },
            {
              "id": 10,
              "module": "gateway:WebhookRespond",
              "version": 1,
              "parameters": {},
              "mapper": {
                "body": "{{9.array}}",
                "status": "200",
                "headers": []
              },
              "metadata": {
                "designer": {
                  "x": 1000,
                  "y": -251
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
              "module": "serpapi:SearchGoogleFlights",
              "version": 1,
              "parameters": {
                "__IMTCONN__": 3714461
              },
              "filter": {
                "name": "1 way",
                "conditions": [
                  [
                    {
                      "a": "{{3.`Arrival Date`}}",
                      "b": "undefined",
                      "o": "text:equal"
                    }
                  ]
                ]
              },
              "mapper": {
                "gl": "nl",
                "type": "2",
                "arrival_id": "{{3.`Arrival Airport`}}",
                "return_date": "{{3.`Arrival Date`}}",
                "departure_id": "{{3.`Departure Airport`}}",
                "travel_class": "{{3.`Flight Class`}}",
                "outbound_date": "{{3.`Departure Date`}}",
                "include_airlines": "{{3.`Airline Code`}}"
              },
              "metadata": {
                "designer": {
                  "x": 454,
                  "y": -3
                },
                "restore": {
                  "expect": {
                    "gl": {
                      "mode": "edit"
                    },
                    "hl": {
                      "mode": "chose",
                      "label": "Empty"
                    },
                    "type": {
                      "mode": "chose",
                      "label": "One way - 2"
                    },
                    "stops": {
                      "mode": "chose",
                      "label": "Empty"
                    },
                    "currency": {
                      "mode": "chose",
                      "label": "Empty"
                    },
                    "no_cache": {
                      "mode": "chose"
                    },
                    "emissions": {
                      "mode": "chose",
                      "label": "Empty"
                    },
                    "show_hidden": {
                      "mode": "chose"
                    },
                    "travel_class": {
                      "mode": "edit"
                    }
                  },
                  "parameters": {
                    "__IMTCONN__": {
                      "data": {
                        "scoped": "true",
                        "connection": "serpapi"
                      },
                      "label": "My SerpApi connection (ben@forcefactory-ai.com)"
                    }
                  }
                },
                "parameters": [
                  {
                    "name": "__IMTCONN__",
                    "type": "account:serpapi",
                    "label": "Connection",
                    "required": true
                  }
                ],
                "expect": [
                  {
                    "name": "departure_id",
                    "type": "text",
                    "label": "`departure_id` Departure airport code / location kgmid",
                    "required": true
                  },
                  {
                    "name": "arrival_id",
                    "type": "text",
                    "label": "`arrival_id` Arrival airport code / location kgmid",
                    "required": true
                  },
                  {
                    "name": "outbound_date",
                    "type": "text",
                    "label": "`outbound_date` Outbound Date",
                    "required": true
                  },
                  {
                    "name": "return_date",
                    "type": "text",
                    "label": "`return_date` Return Date"
                  },
                  {
                    "name": "gl",
                    "type": "select",
                    "label": "`gl` Country",
                    "validate": {
                      "enum": [
                        "af",
                        "al",
                        "dz",
                        "as",
                        "ad",
                        "ao",
                        "ai",
                        "aq",
                        "ag",
                        "ar",
                        "am",
                        "aw",
                        "au",
                        "at",
                        "az",
                        "bs",
                        "bh",
                        "bd",
                        "bb",
                        "by",
                        "be",
                        "bz",
                        "bj",
                        "bm",
                        "bt",
                        "bo",
                        "ba",
                        "bw",
                        "bv",
                        "br",
                        "io",
                        "bn",
                        "bg",
                        "bf",
                        "bi",
                        "kh",
                        "cm",
                        "ca",
                        "cv",
                        "ky",
                        "cf",
                        "td",
                        "cl",
                        "cn",
                        "cx",
                        "cc",
                        "co",
                        "km",
                        "cg",
                        "cd",
                        "ck",
                        "cr",
                        "ci",
                        "hr",
                        "cu",
                        "cy",
                        "cz",
                        "dk",
                        "dj",
                        "dm",
                        "do",
                        "ec",
                        "eg",
                        "sv",
                        "gq",
                        "er",
                        "ee",
                        "et",
                        "fk",
                        "fo",
                        "fj",
                        "fi",
                        "fr",
                        "gf",
                        "pf",
                        "tf",
                        "ga",
                        "gm",
                        "ge",
                        "de",
                        "gh",
                        "gi",
                        "gr",
                        "gl",
                        "gd",
                        "gp",
                        "gu",
                        "gt",
                        "gn",
                        "gw",
                        "gy",
                        "ht",
                        "hm",
                        "va",
                        "hn",
                        "hk",
                        "hu",
                        "is",
                        "in",
                        "id",
                        "ir",
                        "iq",
                        "ie",
                        "il",
                        "it",
                        "jm",
                        "jp",
                        "jo",
                        "kz",
                        "ke",
                        "ki",
                        "kp",
                        "kr",
                        "kw",
                        "kg",
                        "la",
                        "lv",
                        "lb",
                        "ls",
                        "lr",
                        "ly",
                        "li",
                        "lt",
                        "lu",
                        "mo",
                        "mk",
                        "mg",
                        "mw",
                        "my",
                        "mv",
                        "ml",
                        "mt",
                        "mh",
                        "mq",
                        "mr",
                        "mu",
                        "yt",
                        "mx",
                        "fm",
                        "md",
                        "mc",
                        "mn",
                        "ms",
                        "ma",
                        "mz",
                        "mm",
                        "na",
                        "nr",
                        "np",
                        "nl",
                        "an",
                        "nc",
                        "nz",
                        "ni",
                        "ne",
                        "ng",
                        "nu",
                        "nf",
                        "mp",
                        "no",
                        "om",
                        "pk",
                        "pw",
                        "ps",
                        "pa",
                        "pg",
                        "py",
                        "pe",
                        "ph",
                        "pn",
                        "pl",
                        "pt",
                        "pr",
                        "qa",
                        "re",
                        "ro",
                        "ru",
                        "rw",
                        "sh",
                        "kn",
                        "lc",
                        "pm",
                        "vc",
                        "ws",
                        "sm",
                        "st",
                        "sa",
                        "sn",
                        "rs",
                        "sc",
                        "sl",
                        "sg",
                        "sk",
                        "si",
                        "sb",
                        "so",
                        "za",
                        "gs",
                        "es",
                        "lk",
                        "sd",
                        "sr",
                        "sj",
                        "sz",
                        "se",
                        "ch",
                        "sy",
                        "tw",
                        "tj",
                        "tz",
                        "th",
                        "tl",
                        "tg",
                        "tk",
                        "to",
                        "tt",
                        "tn",
                        "tr",
                        "tm",
                        "tc",
                        "tv",
                        "ug",
                        "ua",
                        "ae",
                        "uk",
                        "gb",
                        "us",
                        "um",
                        "uy",
                        "uz",
                        "vu",
                        "ve",
                        "vn",
                        "vg",
                        "vi",
                        "wf",
                        "eh",
                        "ye",
                        "zm",
                        "zw"
                      ]
                    }
                  },
                  {
                    "name": "hl",
                    "type": "select",
                    "label": "`hl` Language",
                    "validate": {
                      "enum": [
                        "af",
                        "ak",
                        "sq",
                        "ws",
                        "am",
                        "ar",
                        "hy",
                        "az",
                        "eu",
                        "be",
                        "bem",
                        "bn",
                        "bh",
                        "xx-bork",
                        "bs",
                        "br",
                        "bg",
                        "bt",
                        "km",
                        "ca",
                        "chr",
                        "ny",
                        "zh-cn",
                        "zh-tw",
                        "co",
                        "hr",
                        "cs",
                        "da",
                        "nl",
                        "xx-elmer",
                        "en",
                        "eo",
                        "et",
                        "ee",
                        "fo",
                        "tl",
                        "fi",
                        "fr",
                        "fy",
                        "gaa",
                        "gl",
                        "ka",
                        "de",
                        "el",
                        "kl",
                        "gn",
                        "gu",
                        "xx-hacker",
                        "ht",
                        "ha",
                        "haw",
                        "iw",
                        "hi",
                        "hu",
                        "is",
                        "ig",
                        "id",
                        "ia",
                        "ga",
                        "it",
                        "ja",
                        "jw",
                        "kn",
                        "kk",
                        "rw",
                        "rn",
                        "xx-klingon",
                        "kg",
                        "ko",
                        "kri",
                        "ku",
                        "ckb",
                        "ky",
                        "lo",
                        "la",
                        "lv",
                        "ln",
                        "lt",
                        "loz",
                        "lg",
                        "ach",
                        "mk",
                        "mg",
                        "ms",
                        "ml",
                        "mt",
                        "mv",
                        "mi",
                        "mr",
                        "mfe",
                        "mo",
                        "mn",
                        "sr-me",
                        "my",
                        "ne",
                        "pcm",
                        "nso",
                        "no",
                        "nn",
                        "oc",
                        "or",
                        "om",
                        "ps",
                        "fa",
                        "xx-pirate",
                        "pl",
                        "pt",
                        "pt-br",
                        "pt-pt",
                        "pa",
                        "qu",
                        "ro",
                        "rm",
                        "nyn",
                        "ru",
                        "gd",
                        "sr",
                        "sh",
                        "st",
                        "tn",
                        "crs",
                        "sn",
                        "sd",
                        "si",
                        "sk",
                        "sl",
                        "so",
                        "es",
                        "es-419",
                        "su",
                        "sw",
                        "sv",
                        "tg",
                        "ta",
                        "tt",
                        "te",
                        "th",
                        "ti",
                        "to",
                        "lua",
                        "tum",
                        "tr",
                        "tk",
                        "tw",
                        "ug",
                        "uk",
                        "ur",
                        "uz",
                        "vu",
                        "vi",
                        "cy",
                        "wo",
                        "xh",
                        "yi",
                        "yo",
                        "zu"
                      ]
                    }
                  },
                  {
                    "name": "currency",
                    "type": "select",
                    "label": "`currency` Currency",
                    "validate": {
                      "enum": [
                        "ALL",
                        "DZD",
                        "ARS",
                        "AMD",
                        "AWG",
                        "AUD",
                        "AZN",
                        "BSD",
                        "BHD",
                        "BYN",
                        "BMD",
                        "BAM",
                        "BRL",
                        "GBP",
                        "BGN",
                        "XPF",
                        "CAD",
                        "CLP",
                        "CNY",
                        "COP",
                        "CRC",
                        "CUP",
                        "CZK",
                        "DKK",
                        "DOP",
                        "EGP",
                        "EUR",
                        "GEL",
                        "HKD",
                        "HUF",
                        "ISK",
                        "INR",
                        "IDR",
                        "IRR",
                        "ILS",
                        "JMD",
                        "JPY",
                        "JOD",
                        "KZT",
                        "KWD",
                        "LBP",
                        "MKD",
                        "MYR",
                        "MXN",
                        "MDL",
                        "MAD",
                        "TWD",
                        "NZD",
                        "NOK",
                        "OMR",
                        "PKR",
                        "PAB",
                        "PEN",
                        "PHP",
                        "PLN",
                        "QAR",
                        "RON",
                        "RUB",
                        "SAR",
                        "RSD",
                        "SGD",
                        "ZAR",
                        "KRW",
                        "SEK",
                        "CHF",
                        "THB",
                        "TRY",
                        "USD",
                        "UAH",
                        "AED",
                        "VND"
                      ]
                    }
                  },
                  {
                    "name": "type",
                    "type": "select",
                    "label": "`type` Flight Type",
                    "validate": {
                      "enum": [
                        "1",
                        "2",
                        "3"
                      ]
                    }
                  },
                  {
                    "name": "travel_class",
                    "type": "select",
                    "label": "`travel_class` Travel Class",
                    "validate": {
                      "enum": [
                        1,
                        2,
                        3,
                        4
                      ]
                    }
                  },
                  {
                    "name": "multi_city_json",
                    "type": "text",
                    "label": "`multi_city_json` Parameters for Multi-city"
                  },
                  {
                    "name": "show_hidden",
                    "type": "boolean",
                    "label": "`show_hidden` Show hidden results"
                  },
                  {
                    "name": "adults",
                    "type": "number",
                    "label": "`adults` Number of Adults"
                  },
                  {
                    "name": "children",
                    "type": "number",
                    "label": "`children` Number of Children"
                  },
                  {
                    "name": "infants_in_seat",
                    "type": "number",
                    "label": "`infants_in_seat` Number of Infants in seat"
                  },
                  {
                    "name": "infants_on_lap",
                    "type": "number",
                    "label": "`infants_on_lap` Number of Infants on lap"
                  },
                  {
                    "name": "stops",
                    "type": "select",
                    "label": "`stops` Stops",
                    "validate": {
                      "enum": [
                        0,
                        1,
                        2,
                        3
                      ]
                    }
                  },
                  {
                    "name": "exclude_airlines",
                    "type": "text",
                    "label": "`exclude_airlines` Exclude airlines"
                  },
                  {
                    "name": "include_airlines",
                    "type": "text",
                    "label": "`include_airlines` Include airlines"
                  },
                  {
                    "name": "bags",
                    "type": "number",
                    "label": "`bags` bags"
                  },
                  {
                    "name": "max_price",
                    "type": "number",
                    "label": "`max_price` Max price"
                  },
                  {
                    "name": "outbound_times",
                    "type": "text",
                    "label": "`outbound_times` Outbound times"
                  },
                  {
                    "name": "return_times",
                    "type": "text",
                    "label": "`return_times` Return times"
                  },
                  {
                    "name": "emissions",
                    "type": "select",
                    "label": "`emissions` Emissions",
                    "validate": {
                      "enum": [
                        1
                      ]
                    }
                  },
                  {
                    "name": "layover_duration",
                    "type": "text",
                    "label": "`layover_duration` Layover duration"
                  },
                  {
                    "name": "exclude_conns",
                    "type": "text",
                    "label": "`exclude_conns` Exclude connecting airports"
                  },
                  {
                    "name": "max_duration",
                    "type": "number",
                    "label": "`max_duration` Max duration"
                  },
                  {
                    "name": "departure_token",
                    "type": "text",
                    "label": "`departure_token` Departure flight token"
                  },
                  {
                    "name": "booking_token",
                    "type": "text",
                    "label": "`booking_token` Booking token"
                  },
                  {
                    "name": "no_cache",
                    "type": "boolean",
                    "label": "`no_cache` Disable Caching"
                  },
                  {
                    "name": "async",
                    "type": "text",
                    "label": "`async` Async"
                  },
                  {
                    "name": "output",
                    "type": "text",
                    "label": "`output` Output"
                  }
                ]
              }
            },
            {
              "id": 7,
              "module": "builtin:BasicAggregator",
              "version": 1,
              "parameters": {
                "feeder": 5
              },
              "mapper": {
                "best_flights": "{{5.best_flights}}",
                "other_flights": "{{5.other_flights}}",
                "price_insights": "{{5.price_insights}}"
              },
              "metadata": {
                "designer": {
                  "x": 721,
                  "y": -4
                },
                "restore": {
                  "extra": {
                    "feeder": {
                      "label": "SerpApi - Search Google Flights [5]"
                    },
                    "target": {
                      "label": "Custom"
                    }
                  }
                }
              }
            },
            {
              "id": 6,
              "module": "gateway:WebhookRespond",
              "version": 1,
              "parameters": {},
              "mapper": {
                "body": "{{7.array}}",
                "status": "200",
                "headers": []
              },
              "metadata": {
                "designer": {
                  "x": 998,
                  "y": -5
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
              "id": 12,
              "module": "serpapi:SearchGoogleFlights",
              "version": 1,
              "parameters": {
                "__IMTCONN__": 3714461
              },
              "mapper": {
                "gl": "nl",
                "arrival_id": "{{3.`Arrival Airport`}}",
                "return_date": "{{3.`Arrival Date`}}",
                "departure_id": "{{3.`Departure Airport`}}",
                "travel_class": "{{3.`Flight Class`}}",
                "outbound_date": "{{3.`Departure Date`}}",
                "include_airlines": "{{3.`Airline Code`}}"
              },
              "metadata": {
                "designer": {
                  "x": 371,
                  "y": 206
                },
                "restore": {
                  "expect": {
                    "gl": {
                      "mode": "edit"
                    },
                    "hl": {
                      "mode": "chose",
                      "label": "Empty"
                    },
                    "type": {
                      "mode": "chose",
                      "label": "Empty"
                    },
                    "stops": {
                      "mode": "chose",
                      "label": "Empty"
                    },
                    "currency": {
                      "mode": "chose",
                      "label": "Empty"
                    },
                    "no_cache": {
                      "mode": "chose"
                    },
                    "emissions": {
                      "mode": "chose",
                      "label": "Empty"
                    },
                    "show_hidden": {
                      "mode": "chose"
                    },
                    "travel_class": {
                      "mode": "edit"
                    }
                  },
                  "parameters": {
                    "__IMTCONN__": {
                      "data": {
                        "scoped": "true",
                        "connection": "serpapi"
                      },
                      "label": "My SerpApi connection (ben@forcefactory-ai.com)"
                    }
                  }
                },
                "parameters": [
                  {
                    "name": "__IMTCONN__",
                    "type": "account:serpapi",
                    "label": "Connection",
                    "required": true
                  }
                ],
                "expect": [
                  {
                    "name": "departure_id",
                    "type": "text",
                    "label": "`departure_id` Departure airport code / location kgmid",
                    "required": true
                  },
                  {
                    "name": "arrival_id",
                    "type": "text",
                    "label": "`arrival_id` Arrival airport code / location kgmid",
                    "required": true
                  },
                  {
                    "name": "outbound_date",
                    "type": "text",
                    "label": "`outbound_date` Outbound Date",
                    "required": true
                  },
                  {
                    "name": "return_date",
                    "type": "text",
                    "label": "`return_date` Return Date"
                  },
                  {
                    "name": "gl",
                    "type": "select",
                    "label": "`gl` Country",
                    "validate": {
                      "enum": [
                        "af",
                        "al",
                        "dz",
                        "as",
                        "ad",
                        "ao",
                        "ai",
                        "aq",
                        "ag",
                        "ar",
                        "am",
                        "aw",
                        "au",
                        "at",
                        "az",
                        "bs",
                        "bh",
                        "bd",
                        "bb",
                        "by",
                        "be",
                        "bz",
                        "bj",
                        "bm",
                        "bt",
                        "bo",
                        "ba",
                        "bw",
                        "bv",
                        "br",
                        "io",
                        "bn",
                        "bg",
                        "bf",
                        "bi",
                        "kh",
                        "cm",
                        "ca",
                        "cv",
                        "ky",
                        "cf",
                        "td",
                        "cl",
                        "cn",
                        "cx",
                        "cc",
                        "co",
                        "km",
                        "cg",
                        "cd",
                        "ck",
                        "cr",
                        "ci",
                        "hr",
                        "cu",
                        "cy",
                        "cz",
                        "dk",
                        "dj",
                        "dm",
                        "do",
                        "ec",
                        "eg",
                        "sv",
                        "gq",
                        "er",
                        "ee",
                        "et",
                        "fk",
                        "fo",
                        "fj",
                        "fi",
                        "fr",
                        "gf",
                        "pf",
                        "tf",
                        "ga",
                        "gm",
                        "ge",
                        "de",
                        "gh",
                        "gi",
                        "gr",
                        "gl",
                        "gd",
                        "gp",
                        "gu",
                        "gt",
                        "gn",
                        "gw",
                        "gy",
                        "ht",
                        "hm",
                        "va",
                        "hn",
                        "hk",
                        "hu",
                        "is",
                        "in",
                        "id",
                        "ir",
                        "iq",
                        "ie",
                        "il",
                        "it",
                        "jm",
                        "jp",
                        "jo",
                        "kz",
                        "ke",
                        "ki",
                        "kp",
                        "kr",
                        "kw",
                        "kg",
                        "la",
                        "lv",
                        "lb",
                        "ls",
                        "lr",
                        "ly",
                        "li",
                        "lt",
                        "lu",
                        "mo",
                        "mk",
                        "mg",
                        "mw",
                        "my",
                        "mv",
                        "ml",
                        "mt",
                        "mh",
                        "mq",
                        "mr",
                        "mu",
                        "yt",
                        "mx",
                        "fm",
                        "md",
                        "mc",
                        "mn",
                        "ms",
                        "ma",
                        "mz",
                        "mm",
                        "na",
                        "nr",
                        "np",
                        "nl",
                        "an",
                        "nc",
                        "nz",
                        "ni",
                        "ne",
                        "ng",
                        "nu",
                        "nf",
                        "mp",
                        "no",
                        "om",
                        "pk",
                        "pw",
                        "ps",
                        "pa",
                        "pg",
                        "py",
                        "pe",
                        "ph",
                        "pn",
                        "pl",
                        "pt",
                        "pr",
                        "qa",
                        "re",
                        "ro",
                        "ru",
                        "rw",
                        "sh",
                        "kn",
                        "lc",
                        "pm",
                        "vc",
                        "ws",
                        "sm",
                        "st",
                        "sa",
                        "sn",
                        "rs",
                        "sc",
                        "sl",
                        "sg",
                        "sk",
                        "si",
                        "sb",
                        "so",
                        "za",
                        "gs",
                        "es",
                        "lk",
                        "sd",
                        "sr",
                        "sj",
                        "sz",
                        "se",
                        "ch",
                        "sy",
                        "tw",
                        "tj",
                        "tz",
                        "th",
                        "tl",
                        "tg",
                        "tk",
                        "to",
                        "tt",
                        "tn",
                        "tr",
                        "tm",
                        "tc",
                        "tv",
                        "ug",
                        "ua",
                        "ae",
                        "uk",
                        "gb",
                        "us",
                        "um",
                        "uy",
                        "uz",
                        "vu",
                        "ve",
                        "vn",
                        "vg",
                        "vi",
                        "wf",
                        "eh",
                        "ye",
                        "zm",
                        "zw"
                      ]
                    }
                  },
                  {
                    "name": "hl",
                    "type": "select",
                    "label": "`hl` Language",
                    "validate": {
                      "enum": [
                        "af",
                        "ak",
                        "sq",
                        "ws",
                        "am",
                        "ar",
                        "hy",
                        "az",
                        "eu",
                        "be",
                        "bem",
                        "bn",
                        "bh",
                        "xx-bork",
                        "bs",
                        "br",
                        "bg",
                        "bt",
                        "km",
                        "ca",
                        "chr",
                        "ny",
                        "zh-cn",
                        "zh-tw",
                        "co",
                        "hr",
                        "cs",
                        "da",
                        "nl",
                        "xx-elmer",
                        "en",
                        "eo",
                        "et",
                        "ee",
                        "fo",
                        "tl",
                        "fi",
                        "fr",
                        "fy",
                        "gaa",
                        "gl",
                        "ka",
                        "de",
                        "el",
                        "kl",
                        "gn",
                        "gu",
                        "xx-hacker",
                        "ht",
                        "ha",
                        "haw",
                        "iw",
                        "hi",
                        "hu",
                        "is",
                        "ig",
                        "id",
                        "ia",
                        "ga",
                        "it",
                        "ja",
                        "jw",
                        "kn",
                        "kk",
                        "rw",
                        "rn",
                        "xx-klingon",
                        "kg",
                        "ko",
                        "kri",
                        "ku",
                        "ckb",
                        "ky",
                        "lo",
                        "la",
                        "lv",
                        "ln",
                        "lt",
                        "loz",
                        "lg",
                        "ach",
                        "mk",
                        "mg",
                        "ms",
                        "ml",
                        "mt",
                        "mv",
                        "mi",
                        "mr",
                        "mfe",
                        "mo",
                        "mn",
                        "sr-me",
                        "my",
                        "ne",
                        "pcm",
                        "nso",
                        "no",
                        "nn",
                        "oc",
                        "or",
                        "om",
                        "ps",
                        "fa",
                        "xx-pirate",
                        "pl",
                        "pt",
                        "pt-br",
                        "pt-pt",
                        "pa",
                        "qu",
                        "ro",
                        "rm",
                        "nyn",
                        "ru",
                        "gd",
                        "sr",
                        "sh",
                        "st",
                        "tn",
                        "crs",
                        "sn",
                        "sd",
                        "si",
                        "sk",
                        "sl",
                        "so",
                        "es",
                        "es-419",
                        "su",
                        "sw",
                        "sv",
                        "tg",
                        "ta",
                        "tt",
                        "te",
                        "th",
                        "ti",
                        "to",
                        "lua",
                        "tum",
                        "tr",
                        "tk",
                        "tw",
                        "ug",
                        "uk",
                        "ur",
                        "uz",
                        "vu",
                        "vi",
                        "cy",
                        "wo",
                        "xh",
                        "yi",
                        "yo",
                        "zu"
                      ]
                    }
                  },
                  {
                    "name": "currency",
                    "type": "select",
                    "label": "`currency` Currency",
                    "validate": {
                      "enum": [
                        "ALL",
                        "DZD",
                        "ARS",
                        "AMD",
                        "AWG",
                        "AUD",
                        "AZN",
                        "BSD",
                        "BHD",
                        "BYN",
                        "BMD",
                        "BAM",
                        "BRL",
                        "GBP",
                        "BGN",
                        "XPF",
                        "CAD",
                        "CLP",
                        "CNY",
                        "COP",
                        "CRC",
                        "CUP",
                        "CZK",
                        "DKK",
                        "DOP",
                        "EGP",
                        "EUR",
                        "GEL",
                        "HKD",
                        "HUF",
                        "ISK",
                        "INR",
                        "IDR",
                        "IRR",
                        "ILS",
                        "JMD",
                        "JPY",
                        "JOD",
                        "KZT",
                        "KWD",
                        "LBP",
                        "MKD",
                        "MYR",
                        "MXN",
                        "MDL",
                        "MAD",
                        "TWD",
                        "NZD",
                        "NOK",
                        "OMR",
                        "PKR",
                        "PAB",
                        "PEN",
                        "PHP",
                        "PLN",
                        "QAR",
                        "RON",
                        "RUB",
                        "SAR",
                        "RSD",
                        "SGD",
                        "ZAR",
                        "KRW",
                        "SEK",
                        "CHF",
                        "THB",
                        "TRY",
                        "USD",
                        "UAH",
                        "AED",
                        "VND"
                      ]
                    }
                  },
                  {
                    "name": "type",
                    "type": "select",
                    "label": "`type` Flight Type",
                    "validate": {
                      "enum": [
                        "1",
                        "2",
                        "3"
                      ]
                    }
                  },
                  {
                    "name": "travel_class",
                    "type": "select",
                    "label": "`travel_class` Travel Class",
                    "validate": {
                      "enum": [
                        1,
                        2,
                        3,
                        4
                      ]
                    }
                  },
                  {
                    "name": "multi_city_json",
                    "type": "text",
                    "label": "`multi_city_json` Parameters for Multi-city"
                  },
                  {
                    "name": "show_hidden",
                    "type": "boolean",
                    "label": "`show_hidden` Show hidden results"
                  },
                  {
                    "name": "adults",
                    "type": "number",
                    "label": "`adults` Number of Adults"
                  },
                  {
                    "name": "children",
                    "type": "number",
                    "label": "`children` Number of Children"
                  },
                  {
                    "name": "infants_in_seat",
                    "type": "number",
                    "label": "`infants_in_seat` Number of Infants in seat"
                  },
                  {
                    "name": "infants_on_lap",
                    "type": "number",
                    "label": "`infants_on_lap` Number of Infants on lap"
                  },
                  {
                    "name": "stops",
                    "type": "select",
                    "label": "`stops` Stops",
                    "validate": {
                      "enum": [
                        0,
                        1,
                        2,
                        3
                      ]
                    }
                  },
                  {
                    "name": "exclude_airlines",
                    "type": "text",
                    "label": "`exclude_airlines` Exclude airlines"
                  },
                  {
                    "name": "include_airlines",
                    "type": "text",
                    "label": "`include_airlines` Include airlines"
                  },
                  {
                    "name": "bags",
                    "type": "number",
                    "label": "`bags` bags"
                  },
                  {
                    "name": "max_price",
                    "type": "number",
                    "label": "`max_price` Max price"
                  },
                  {
                    "name": "outbound_times",
                    "type": "text",
                    "label": "`outbound_times` Outbound times"
                  },
                  {
                    "name": "return_times",
                    "type": "text",
                    "label": "`return_times` Return times"
                  },
                  {
                    "name": "emissions",
                    "type": "select",
                    "label": "`emissions` Emissions",
                    "validate": {
                      "enum": [
                        1
                      ]
                    }
                  },
                  {
                    "name": "layover_duration",
                    "type": "text",
                    "label": "`layover_duration` Layover duration"
                  },
                  {
                    "name": "exclude_conns",
                    "type": "text",
                    "label": "`exclude_conns` Exclude connecting airports"
                  },
                  {
                    "name": "max_duration",
                    "type": "number",
                    "label": "`max_duration` Max duration"
                  },
                  {
                    "name": "departure_token",
                    "type": "text",
                    "label": "`departure_token` Departure flight token"
                  },
                  {
                    "name": "booking_token",
                    "type": "text",
                    "label": "`booking_token` Booking token"
                  },
                  {
                    "name": "no_cache",
                    "type": "boolean",
                    "label": "`no_cache` Disable Caching"
                  },
                  {
                    "name": "async",
                    "type": "text",
                    "label": "`async` Async"
                  },
                  {
                    "name": "output",
                    "type": "text",
                    "label": "`output` Output"
                  }
                ]
              }
            },
            {
              "id": 13,
              "module": "builtin:BasicAggregator",
              "version": 1,
              "parameters": {
                "feeder": 12
              },
              "mapper": {
                "best_flights": "{{12.best_flights}}",
                "other_flights": "{{12.other_flights}}",
                "price_insights": "{{12.price_insights}}"
              },
              "metadata": {
                "designer": {
                  "x": 638,
                  "y": 205
                },
                "restore": {
                  "extra": {
                    "feeder": {
                      "label": "SerpApi - Search Google Flights [5]"
                    },
                    "target": {
                      "label": "Custom"
                    }
                  }
                }
              }
            },
            {
              "id": 14,
              "module": "gateway:WebhookRespond",
              "version": 1,
              "parameters": {},
              "mapper": {
                "body": "{{13.array}}",
                "status": "200",
                "headers": []
              },
              "metadata": {
                "designer": {
                  "x": 915,
                  "y": 204
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
              "id": 15,
              "module": "serpapi:SearchGoogleFlights",
              "version": 1,
              "parameters": {
                "__IMTCONN__": 3714461
              },
              "filter": {
                "name": "Airline not defined",
                "conditions": [
                  [
                    {
                      "a": "{{3.`Airline Code`}}",
                      "b": "undefined",
                      "o": "text:equal"
                    }
                  ]
                ]
              },
              "mapper": {
                "gl": "nl",
                "arrival_id": "{{3.`Arrival Airport`}}",
                "return_date": "{{3.`Arrival Date`}}",
                "departure_id": "{{3.`Departure Airport`}}",
                "travel_class": "{{3.`Flight Class`}}",
                "outbound_date": "{{3.`Departure Date`}}"
              },
              "metadata": {
                "designer": {
                  "x": 388,
                  "y": -486
                },
                "restore": {
                  "expect": {
                    "gl": {
                      "mode": "edit"
                    },
                    "hl": {
                      "mode": "chose",
                      "label": "Empty"
                    },
                    "type": {
                      "mode": "chose",
                      "label": "Empty"
                    },
                    "stops": {
                      "mode": "chose",
                      "label": "Empty"
                    },
                    "currency": {
                      "mode": "chose",
                      "label": "Empty"
                    },
                    "no_cache": {
                      "mode": "chose"
                    },
                    "emissions": {
                      "mode": "chose",
                      "label": "Empty"
                    },
                    "show_hidden": {
                      "mode": "chose"
                    },
                    "travel_class": {
                      "mode": "edit"
                    }
                  },
                  "parameters": {
                    "__IMTCONN__": {
                      "data": {
                        "scoped": "true",
                        "connection": "serpapi"
                      },
                      "label": "My SerpApi connection (ben@forcefactory-ai.com)"
                    }
                  }
                },
                "parameters": [
                  {
                    "name": "__IMTCONN__",
                    "type": "account:serpapi",
                    "label": "Connection",
                    "required": true
                  }
                ],
                "expect": [
                  {
                    "name": "departure_id",
                    "type": "text",
                    "label": "`departure_id` Departure airport code / location kgmid",
                    "required": true
                  },
                  {
                    "name": "arrival_id",
                    "type": "text",
                    "label": "`arrival_id` Arrival airport code / location kgmid",
                    "required": true
                  },
                  {
                    "name": "outbound_date",
                    "type": "text",
                    "label": "`outbound_date` Outbound Date",
                    "required": true
                  },
                  {
                    "name": "return_date",
                    "type": "text",
                    "label": "`return_date` Return Date"
                  },
                  {
                    "name": "gl",
                    "type": "select",
                    "label": "`gl` Country",
                    "validate": {
                      "enum": [
                        "af",
                        "al",
                        "dz",
                        "as",
                        "ad",
                        "ao",
                        "ai",
                        "aq",
                        "ag",
                        "ar",
                        "am",
                        "aw",
                        "au",
                        "at",
                        "az",
                        "bs",
                        "bh",
                        "bd",
                        "bb",
                        "by",
                        "be",
                        "bz",
                        "bj",
                        "bm",
                        "bt",
                        "bo",
                        "ba",
                        "bw",
                        "bv",
                        "br",
                        "io",
                        "bn",
                        "bg",
                        "bf",
                        "bi",
                        "kh",
                        "cm",
                        "ca",
                        "cv",
                        "ky",
                        "cf",
                        "td",
                        "cl",
                        "cn",
                        "cx",
                        "cc",
                        "co",
                        "km",
                        "cg",
                        "cd",
                        "ck",
                        "cr",
                        "ci",
                        "hr",
                        "cu",
                        "cy",
                        "cz",
                        "dk",
                        "dj",
                        "dm",
                        "do",
                        "ec",
                        "eg",
                        "sv",
                        "gq",
                        "er",
                        "ee",
                        "et",
                        "fk",
                        "fo",
                        "fj",
                        "fi",
                        "fr",
                        "gf",
                        "pf",
                        "tf",
                        "ga",
                        "gm",
                        "ge",
                        "de",
                        "gh",
                        "gi",
                        "gr",
                        "gl",
                        "gd",
                        "gp",
                        "gu",
                        "gt",
                        "gn",
                        "gw",
                        "gy",
                        "ht",
                        "hm",
                        "va",
                        "hn",
                        "hk",
                        "hu",
                        "is",
                        "in",
                        "id",
                        "ir",
                        "iq",
                        "ie",
                        "il",
                        "it",
                        "jm",
                        "jp",
                        "jo",
                        "kz",
                        "ke",
                        "ki",
                        "kp",
                        "kr",
                        "kw",
                        "kg",
                        "la",
                        "lv",
                        "lb",
                        "ls",
                        "lr",
                        "ly",
                        "li",
                        "lt",
                        "lu",
                        "mo",
                        "mk",
                        "mg",
                        "mw",
                        "my",
                        "mv",
                        "ml",
                        "mt",
                        "mh",
                        "mq",
                        "mr",
                        "mu",
                        "yt",
                        "mx",
                        "fm",
                        "md",
                        "mc",
                        "mn",
                        "ms",
                        "ma",
                        "mz",
                        "mm",
                        "na",
                        "nr",
                        "np",
                        "nl",
                        "an",
                        "nc",
                        "nz",
                        "ni",
                        "ne",
                        "ng",
                        "nu",
                        "nf",
                        "mp",
                        "no",
                        "om",
                        "pk",
                        "pw",
                        "ps",
                        "pa",
                        "pg",
                        "py",
                        "pe",
                        "ph",
                        "pn",
                        "pl",
                        "pt",
                        "pr",
                        "qa",
                        "re",
                        "ro",
                        "ru",
                        "rw",
                        "sh",
                        "kn",
                        "lc",
                        "pm",
                        "vc",
                        "ws",
                        "sm",
                        "st",
                        "sa",
                        "sn",
                        "rs",
                        "sc",
                        "sl",
                        "sg",
                        "sk",
                        "si",
                        "sb",
                        "so",
                        "za",
                        "gs",
                        "es",
                        "lk",
                        "sd",
                        "sr",
                        "sj",
                        "sz",
                        "se",
                        "ch",
                        "sy",
                        "tw",
                        "tj",
                        "tz",
                        "th",
                        "tl",
                        "tg",
                        "tk",
                        "to",
                        "tt",
                        "tn",
                        "tr",
                        "tm",
                        "tc",
                        "tv",
                        "ug",
                        "ua",
                        "ae",
                        "uk",
                        "gb",
                        "us",
                        "um",
                        "uy",
                        "uz",
                        "vu",
                        "ve",
                        "vn",
                        "vg",
                        "vi",
                        "wf",
                        "eh",
                        "ye",
                        "zm",
                        "zw"
                      ]
                    }
                  },
                  {
                    "name": "hl",
                    "type": "select",
                    "label": "`hl` Language",
                    "validate": {
                      "enum": [
                        "af",
                        "ak",
                        "sq",
                        "ws",
                        "am",
                        "ar",
                        "hy",
                        "az",
                        "eu",
                        "be",
                        "bem",
                        "bn",
                        "bh",
                        "xx-bork",
                        "bs",
                        "br",
                        "bg",
                        "bt",
                        "km",
                        "ca",
                        "chr",
                        "ny",
                        "zh-cn",
                        "zh-tw",
                        "co",
                        "hr",
                        "cs",
                        "da",
                        "nl",
                        "xx-elmer",
                        "en",
                        "eo",
                        "et",
                        "ee",
                        "fo",
                        "tl",
                        "fi",
                        "fr",
                        "fy",
                        "gaa",
                        "gl",
                        "ka",
                        "de",
                        "el",
                        "kl",
                        "gn",
                        "gu",
                        "xx-hacker",
                        "ht",
                        "ha",
                        "haw",
                        "iw",
                        "hi",
                        "hu",
                        "is",
                        "ig",
                        "id",
                        "ia",
                        "ga",
                        "it",
                        "ja",
                        "jw",
                        "kn",
                        "kk",
                        "rw",
                        "rn",
                        "xx-klingon",
                        "kg",
                        "ko",
                        "kri",
                        "ku",
                        "ckb",
                        "ky",
                        "lo",
                        "la",
                        "lv",
                        "ln",
                        "lt",
                        "loz",
                        "lg",
                        "ach",
                        "mk",
                        "mg",
                        "ms",
                        "ml",
                        "mt",
                        "mv",
                        "mi",
                        "mr",
                        "mfe",
                        "mo",
                        "mn",
                        "sr-me",
                        "my",
                        "ne",
                        "pcm",
                        "nso",
                        "no",
                        "nn",
                        "oc",
                        "or",
                        "om",
                        "ps",
                        "fa",
                        "xx-pirate",
                        "pl",
                        "pt",
                        "pt-br",
                        "pt-pt",
                        "pa",
                        "qu",
                        "ro",
                        "rm",
                        "nyn",
                        "ru",
                        "gd",
                        "sr",
                        "sh",
                        "st",
                        "tn",
                        "crs",
                        "sn",
                        "sd",
                        "si",
                        "sk",
                        "sl",
                        "so",
                        "es",
                        "es-419",
                        "su",
                        "sw",
                        "sv",
                        "tg",
                        "ta",
                        "tt",
                        "te",
                        "th",
                        "ti",
                        "to",
                        "lua",
                        "tum",
                        "tr",
                        "tk",
                        "tw",
                        "ug",
                        "uk",
                        "ur",
                        "uz",
                        "vu",
                        "vi",
                        "cy",
                        "wo",
                        "xh",
                        "yi",
                        "yo",
                        "zu"
                      ]
                    }
                  },
                  {
                    "name": "currency",
                    "type": "select",
                    "label": "`currency` Currency",
                    "validate": {
                      "enum": [
                        "ALL",
                        "DZD",
                        "ARS",
                        "AMD",
                        "AWG",
                        "AUD",
                        "AZN",
                        "BSD",
                        "BHD",
                        "BYN",
                        "BMD",
                        "BAM",
                        "BRL",
                        "GBP",
                        "BGN",
                        "XPF",
                        "CAD",
                        "CLP",
                        "CNY",
                        "COP",
                        "CRC",
                        "CUP",
                        "CZK",
                        "DKK",
                        "DOP",
                        "EGP",
                        "EUR",
                        "GEL",
                        "HKD",
                        "HUF",
                        "ISK",
                        "INR",
                        "IDR",
                        "IRR",
                        "ILS",
                        "JMD",
                        "JPY",
                        "JOD",
                        "KZT",
                        "KWD",
                        "LBP",
                        "MKD",
                        "MYR",
                        "MXN",
                        "MDL",
                        "MAD",
                        "TWD",
                        "NZD",
                        "NOK",
                        "OMR",
                        "PKR",
                        "PAB",
                        "PEN",
                        "PHP",
                        "PLN",
                        "QAR",
                        "RON",
                        "RUB",
                        "SAR",
                        "RSD",
                        "SGD",
                        "ZAR",
                        "KRW",
                        "SEK",
                        "CHF",
                        "THB",
                        "TRY",
                        "USD",
                        "UAH",
                        "AED",
                        "VND"
                      ]
                    }
                  },
                  {
                    "name": "type",
                    "type": "select",
                    "label": "`type` Flight Type",
                    "validate": {
                      "enum": [
                        "1",
                        "2",
                        "3"
                      ]
                    }
                  },
                  {
                    "name": "travel_class",
                    "type": "select",
                    "label": "`travel_class` Travel Class",
                    "validate": {
                      "enum": [
                        1,
                        2,
                        3,
                        4
                      ]
                    }
                  },
                  {
                    "name": "multi_city_json",
                    "type": "text",
                    "label": "`multi_city_json` Parameters for Multi-city"
                  },
                  {
                    "name": "show_hidden",
                    "type": "boolean",
                    "label": "`show_hidden` Show hidden results"
                  },
                  {
                    "name": "adults",
                    "type": "number",
                    "label": "`adults` Number of Adults"
                  },
                  {
                    "name": "children",
                    "type": "number",
                    "label": "`children` Number of Children"
                  },
                  {
                    "name": "infants_in_seat",
                    "type": "number",
                    "label": "`infants_in_seat` Number of Infants in seat"
                  },
                  {
                    "name": "infants_on_lap",
                    "type": "number",
                    "label": "`infants_on_lap` Number of Infants on lap"
                  },
                  {
                    "name": "stops",
                    "type": "select",
                    "label": "`stops` Stops",
                    "validate": {
                      "enum": [
                        0,
                        1,
                        2,
                        3
                      ]
                    }
                  },
                  {
                    "name": "exclude_airlines",
                    "type": "text",
                    "label": "`exclude_airlines` Exclude airlines"
                  },
                  {
                    "name": "include_airlines",
                    "type": "text",
                    "label": "`include_airlines` Include airlines"
                  },
                  {
                    "name": "bags",
                    "type": "number",
                    "label": "`bags` bags"
                  },
                  {
                    "name": "max_price",
                    "type": "number",
                    "label": "`max_price` Max price"
                  },
                  {
                    "name": "outbound_times",
                    "type": "text",
                    "label": "`outbound_times` Outbound times"
                  },
                  {
                    "name": "return_times",
                    "type": "text",
                    "label": "`return_times` Return times"
                  },
                  {
                    "name": "emissions",
                    "type": "select",
                    "label": "`emissions` Emissions",
                    "validate": {
                      "enum": [
                        1
                      ]
                    }
                  },
                  {
                    "name": "layover_duration",
                    "type": "text",
                    "label": "`layover_duration` Layover duration"
                  },
                  {
                    "name": "exclude_conns",
                    "type": "text",
                    "label": "`exclude_conns` Exclude connecting airports"
                  },
                  {
                    "name": "max_duration",
                    "type": "number",
                    "label": "`max_duration` Max duration"
                  },
                  {
                    "name": "departure_token",
                    "type": "text",
                    "label": "`departure_token` Departure flight token"
                  },
                  {
                    "name": "booking_token",
                    "type": "text",
                    "label": "`booking_token` Booking token"
                  },
                  {
                    "name": "no_cache",
                    "type": "boolean",
                    "label": "`no_cache` Disable Caching"
                  },
                  {
                    "name": "async",
                    "type": "text",
                    "label": "`async` Async"
                  },
                  {
                    "name": "output",
                    "type": "text",
                    "label": "`output` Output"
                  }
                ]
              }
            },
            {
              "id": 16,
              "module": "builtin:BasicAggregator",
              "version": 1,
              "parameters": {
                "feeder": 15
              },
              "mapper": {
                "best_flights": "{{15.best_flights}}",
                "other_flights": "{{15.other_flights}}",
                "price_insights": "{{15.price_insights}}"
              },
              "metadata": {
                "designer": {
                  "x": 740,
                  "y": -484
                },
                "restore": {
                  "extra": {
                    "feeder": {
                      "label": "SerpApi - Search Google Flights [5]"
                    },
                    "target": {
                      "label": "Custom"
                    }
                  }
                }
              }
            },
            {
              "id": 17,
              "module": "gateway:WebhookRespond",
              "version": 1,
              "parameters": {},
              "mapper": {
                "body": "{{16.array}}",
                "status": "200",
                "headers": []
              },
              "metadata": {
                "designer": {
                  "x": 1017,
                  "y": -485
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
