#!/bin/bash

curl -XDELETE 'localhost:9200/data_logger?pretty'

curl -XPUT http://localhost:9200/data_logger -d '{
    "mappings" : {
        "measurement" : {
           "_all" : {"enabled" : false},
           "properties" : {
                "value": {
                    "type": "double"
                },
                "id": {
                    "type": "string",
                    "index":  "not_analyzed"
                },
                "type": {
                    "type": "string",
                    "index":  "not_analyzed"
                },
                "location": {
                    "type": "string",
                    "index":  "not_analyzed"
                }
           }
        }
   }
}'