# About

Hacking with ELK stack. Aiming to gather and visualize temperature/humidity logger data.


# Install

 * logstash

     * bin/plugin install logstash-filter-translate
 
 * elasticsearch
 
 * for elasticsearch watcher:
 
     * bin/plugin install license
 
     * bin/plugin install watcher
     
     * in config/elasticsearch.yml:
     
         * script.inline: on
     
         * script.indexed: on


# Kibana visualizations

 * http://127.0.0.1:5601/app/kibana#/visualize/edit/Kaikki-mittarit?_g=(filters:!(),refreshInterval:(display:'10%20seconds',pause:!f,section:1,value:10000),time:(from:now-1y,mode:quick,to:now))&_a=(filters:!(),linked:!f,query:(query_string:(analyze_wildcard:!t,query:'*')),uiState:(),vis:(aggs:!((id:'1',params:(field:value),schema:metric,type:avg),(id:'2',params:(customInterval:'2h',extended_bounds:(),field:'@timestamp',interval:auto,min_doc_count:1),schema:segment,type:date_histogram),(id:'3',params:(field:location,order:desc,orderBy:_term,size:10),schema:group,type:terms),(id:'4',params:(field:value_unit,order:desc,orderBy:_term,row:!t,size:2),schema:split,type:terms)),listeners:(),params:(addLegend:!t,addTimeMarker:!f,addTooltip:!t,defaultYExtents:!f,drawLinesBetweenPoints:!t,interpolate:linear,radiusRatio:9,scale:linear,setYExtents:!f,shareYAxis:!t,showCircles:!t,smoothLines:!f,times:!(),yAxis:()),type:line))


# TODO

 * Configurable key

 * Configurable location for devices.yaml

 * Email notifications for dead meters

