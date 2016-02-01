#!/bin/bash

database=../data_logger.db
output_file=../test_data.csv

sqlite3 -batch -csv $database \
    "select d.external_id, d.type_id, strftime('%Y-%m-%dT%H:%M:%SZ', datetime(m.taken_utc_s, 'unixepoch', 'localtime')), m.value from measurement m, device d where m.device_id = d.id;" \
    > $output_file

echo "Wrote data to $output_file"

