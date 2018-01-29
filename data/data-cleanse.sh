#!/usr/bin/env bash

# aggregate raw monthly data into a single file with trailing commas removed (5671365 records)
# remove flights that never arrived (canceled, etc.) as indicated by the presence of ,, in a raw CSV (5573747 records) 
# zip the file

raw_data_dir=raw
name=Flights_Dec2016-Nov2017
aggregate_file=$name.csv
zip_file=$name.zip

header=`head -1 $(ls $raw_data_dir/*\.csv | head -1) | sed -i 's/,$//g'`

echo $header > $aggregate_file
for file in `ls $raw_data_dir/*\.csv`; do
    echo "Processing $file"
    tail --lines=+2 $file | grep -v ,, | sed -i 's/,$//g' >> $aggregate_file 
done

zip $zip_file $aggregate_file

echo "Finished"