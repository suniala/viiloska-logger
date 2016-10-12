#!/bin/bash

curl -XPOST 'localhost:9200/data_logger/_search?pretty' -d '
{
  "query": { "match": { "_type": "measurement" } },
  "sort": { "@timestamp": { "order": "desc" } },
  "size": 10
}'
