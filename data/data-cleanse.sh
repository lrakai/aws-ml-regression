#!/usr/bin/env bash

# aggregate raw monthly data into a single file (5671365 records)
# remove flights that never arrived (canceled, etc.) as indicated by the presence of ,, in a raw CSV (5573747 records) 
# zip the file

raw_data_dir=raw
name=Flights_Dec2016-Nov2017
aggregate_file=$name.csv
zip_file=$name.zip

header=`head -1 $(ls $raw_data_dir/*\.csv | head -1)`

echo $header > $aggregate_file
for file in `ls $raw_data_dir/*\.csv`; do
    tail --lines=+2 $file | grep -v ,, >> $aggregate_file 
done

zip $zip_file $aggregate_file
rm $aggregate_file