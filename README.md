# Viiloska Logger

Hacking with ELK stack. Aiming to gather and visualize temperature/humidity logger data.


## Install

```
docker-compose up -d
./setup-index.sh
```


## Kibana visualizations

 * Temp/rh measurements: http://127.0.0.1:5601/app/kibana#/visualize/edit/Kaikki-mittarit?_g=(filters:!(),refreshInterval:(display:'10%20seconds',pause:!f,section:1,value:10000),time:(from:now-1y,mode:quick,to:now))&_a=(filters:!(),linked:!f,query:(query_string:(analyze_wildcard:!t,query:'*')),uiState:(),vis:(aggs:!((id:'1',params:(field:value),schema:metric,type:avg),(id:'2',params:(customInterval:'2h',extended_bounds:(),field:'@timestamp',interval:auto,min_doc_count:1),schema:segment,type:date_histogram),(id:'3',params:(field:location,order:desc,orderBy:_term,size:10),schema:group,type:terms),(id:'4',params:(field:value_unit,order:desc,orderBy:_term,row:!t,size:2),schema:split,type:terms)),listeners:(),params:(addLegend:!t,addTimeMarker:!f,addTooltip:!t,defaultYExtents:!f,drawLinesBetweenPoints:!t,interpolate:linear,radiusRatio:9,scale:linear,setYExtents:!f,shareYAxis:!t,showCircles:!t,smoothLines:!f,times:!(),yAxis:()),type:line))

 * Device statuses: http://127.0.0.1:5601/app/kibana#/visualize/edit/Mittareiden-tilat?_g=(filters:!(),refreshInterval:(display:'1%20minute',pause:!f,section:2,value:60000),time:(from:now-1y,mode:quick,to:now))&_a=(filters:!(),linked:!f,query:(query_string:(analyze_wildcard:!t,query:'_type:device_status')),uiState:(),vis:(aggs:!((id:'1',params:(field:'@timestamp'),schema:metric,type:max),(id:'2',params:(field:device_id,order:asc,orderBy:_term,size:0),schema:bucket,type:terms),(id:'3',params:(field:location,order:asc,orderBy:_term,size:0),schema:bucket,type:terms)),listeners:(),params:(perPage:10,showMeticsAtAllLevels:!f,showPartialRows:!f),type:table))


## TODO

 * Automate kibana setup (index name etc)

 * Automate kibana visualization setup or provide convenience links for visualizations

 * Configurable key

 * Move devices.yaml under env

 * Move bulk import into another service so that same file is not reimported when
   logstash is restarted

 * Email notifications for dead meters

