#!/bin/bash

curl -XPUT 'http://localhost:9200/_watcher/watch/data_logger_watch' -d '{
  "trigger" : { "schedule" : { "interval" : "10s" } },
  "input" : {
    "search" : {
      "request" : {
        "indices" : [ "data_logger" ],
        "body" : {
          "query" : {
            "bool": {
              "must": {"match": { "_type": "device_status" } },
              "must": {
                "range" : {
                  "@timestamp" : { "lt" : "now-10m" }
                }
              }
            }
          }
        }
      }
    }
  },
  "condition" : {
    "compare" : { "ctx.payload.hits.total" : { "gt" : 0 }}
  },
  "transform" : {
    "script" : "return [ 'errors' : ctx.payload.hits.hits.collect { it._source.message } ]"
  },
  "actions" : {
    "log_error" : {
      "logging" : {
        "text" : "varoitus! mittari {{ctx.payload.errors}} on myöhässä!"
      }
    }
  }
}'

# {{ctx.payload.hits.hits.2._source}}
