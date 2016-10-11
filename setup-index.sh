#!/bin/bash

curl -XPUT http://localhost:9200/data_logger -d '{
    "mappings" : {
        "measurement" : {
           "_all" : {"enabled" : false},
           "properties" : {
                "device_id": {
                    "type": "string",
                    "index":  "not_analyzed"
                },
                "location": {
                    "type": "string",
                    "index":  "not_analyzed"
                },
                "value": {
                    "type": "double"
                },
                "value_unit": {
                    "type": "string",
                    "index":  "not_analyzed"
                },
                "value_unit_id": {
                    "type": "string",
                    "index":  "not_analyzed"
                }
           }
        }
   }
}'