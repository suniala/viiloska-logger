#!/bin/bash

curl -XPOST 'localhost:9200/data_logger/_search?pretty' -d '
{
  "query": { "match": { "_type": "device_status" } }
}'
