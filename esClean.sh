#!/bin/sh  
# example: sh  esClean.sh wifi @timestamp 30 

index_name=$1
daycolumn=$2
savedays=$3

if [ ! -n "$savedays" ]; then
  echo "please input savedays like 30"  
  exit 1
fi

someday=`date -d " ${savedays} days ago " +%Y-%m-%d`

somedaytime=`date -d $someday +%s000`

curl -XPOST "192.168.1.31:9200/$index_name/_delete_by_query?" -d "{\"query\":{\"bool\":{\"must\":{\"range\":{\"$daycolumn\":{\"gte\":null,\"lt\":$somedaytime}}}}}}"