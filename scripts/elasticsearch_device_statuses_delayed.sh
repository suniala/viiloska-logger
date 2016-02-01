#!/bin/bash

curl -XPOST 'localhost:9200/data_logger/_search?pretty' -d '
{
  "query": {
    "bool": {
      "must": {"match": { "_type": "device_status" } },
      "must": {
        "range" : {
          "@timestamp" : { "lt" : "now-10m" }
        }
      }
    }
  }
}'
