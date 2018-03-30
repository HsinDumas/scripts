#!/bin/bash
yesterday=`date -d " 1  days ago " +%Y-%m-%d`
today=`date -d " now " +%Y-%m-%d`

yesterdaytime=`date -d $yesterday +%s000`
todaytime=`date -d $today +%s000`

key0=`curl -XGET '192.168.1.31:9200/error/error/_search?' -d "{\"size\":0,\"query\":{\"range\":{\"timestamp\":{\"gte\":$yesterdaytime,\"lt\":$todaytime}}},\"aggs\":{\"times\":{\"terms\":{\"field\":\"videoId.keyword\"}}}}" | jq .aggregations.times.buckets[0].key`
content0=`curl -XGET '192.168.1.31:9200/error/error/_search?' -d "{\"size\":1,\"query\":{\"bool\":{\"must\":[{\"term\":{\"videoId\":$key0}},{\"range\":{\"timestamp\":{\"gte\":$yesterdaytime,\"lt\":$todaytime}}}]}}}" | jq .hits.hits[0]._source`

key1=`curl -XGET '192.168.1.31:9200/error/error/_search?' -d "{\"size\":0,\"query\":{\"range\":{\"timestamp\":{\"gte\":$yesterdaytime,\"lt\":$todaytime}}},\"aggs\":{\"times\":{\"terms\":{\"field\":\"videoId.keyword\"}}}}" | jq .aggregations.times.buckets[1].key`
content1=`curl -XGET '192.168.1.31:9200/error/error/_search?' -d "{\"size\":1,\"query\":{\"bool\":{\"must\":[{\"term\":{\"videoId\":$key1}},{\"range\":{\"timestamp\":{\"gte\":$yesterdaytime,\"lt\":$todaytime}}}]}}}" | jq .hits.hits[0]._source`

key2=`curl -XGET '192.168.1.31:9200/error/error/_search?' -d "{\"size\":0,\"query\":{\"range\":{\"timestamp\":{\"gte\":$yesterdaytime,\"lt\":$todaytime}}},\"aggs\":{\"times\":{\"terms\":{\"field\":\"videoId.keyword\"}}}}" | jq .aggregations.times.buckets[2].key`
content2=`curl -XGET '192.168.1.31:9200/error/error/_search?' -d "{\"size\":1,\"query\":{\"bool\":{\"must\":[{\"term\":{\"videoId\":$key2}},{\"range\":{\"timestamp\":{\"gte\":$yesterdaytime,\"lt\":$todaytime}}}]}}}" | jq .hits.hits[0]._source`

key3=`curl -XGET '192.168.1.31:9200/error/error/_search?' -d "{\"size\":0,\"query\":{\"range\":{\"timestamp\":{\"gte\":$yesterdaytime,\"lt\":$todaytime}}},\"aggs\":{\"times\":{\"terms\":{\"field\":\"videoId.keyword\"}}}}" | jq .aggregations.times.buckets[3].key`
content3=`curl -XGET '192.168.1.31:9200/error/error/_search?' -d "{\"size\":1,\"query\":{\"bool\":{\"must\":[{\"term\":{\"videoId\":$key3}},{\"range\":{\"timestamp\":{\"gte\":$yesterdaytime,\"lt\":$todaytime}}}]}}}" | jq .hits.hits[0]._source`

key4=`curl -XGET '192.168.1.31:9200/error/error/_search?' -d "{\"size\":0,\"query\":{\"range\":{\"timestamp\":{\"gte\":$yesterdaytime,\"lt\":$todaytime}}},\"aggs\":{\"times\":{\"terms\":{\"field\":\"videoId.keyword\"}}}}" | jq .aggregations.times.buckets[4].key`
content4=`curl -XGET '192.168.1.31:9200/error/error/_search?' -d "{\"size\":1,\"query\":{\"bool\":{\"must\":[{\"term\":{\"videoId\":$key4}},{\"range\":{\"timestamp\":{\"gte\":$yesterdaytime,\"lt\":$todaytime}}}]}}}" | jq .hits.hits[0]._source`

key5=`curl -XGET '192.168.1.31:9200/error/error/_search?' -d "{\"size\":0,\"query\":{\"range\":{\"timestamp\":{\"gte\":$yesterdaytime,\"lt\":$todaytime}}},\"aggs\":{\"times\":{\"terms\":{\"field\":\"videoId.keyword\"}}}}" | jq .aggregations.times.buckets[5].key`
content5=`curl -XGET '192.168.1.31:9200/error/error/_search?' -d "{\"size\":1,\"query\":{\"bool\":{\"must\":[{\"term\":{\"videoId\":$key5}},{\"range\":{\"timestamp\":{\"gte\":$yesterdaytime,\"lt\":$todaytime}}}]}}}" | jq .hits.hits[0]._source`

key6=`curl -XGET '192.168.1.31:9200/error/error/_search?' -d "{\"size\":0,\"query\":{\"range\":{\"timestamp\":{\"gte\":$yesterdaytime,\"lt\":$todaytime}}},\"aggs\":{\"times\":{\"terms\":{\"field\":\"videoId.keyword\"}}}}" | jq .aggregations.times.buckets[6].key`
content6=`curl -XGET '192.168.1.31:9200/error/error/_search?' -d "{\"size\":1,\"query\":{\"bool\":{\"must\":[{\"term\":{\"videoId\":$key6}},{\"range\":{\"timestamp\":{\"gte\":$yesterdaytime,\"lt\":$todaytime}}}]}}}" | jq .hits.hits[0]._source`

key7=`curl -XGET '192.168.1.31:9200/error/error/_search?' -d "{\"size\":0,\"query\":{\"range\":{\"timestamp\":{\"gte\":$yesterdaytime,\"lt\":$todaytime}}},\"aggs\":{\"times\":{\"terms\":{\"field\":\"videoId.keyword\"}}}}" | jq .aggregations.times.buckets[7].key`
content7=`curl -XGET '192.168.1.31:9200/error/error/_search?' -d "{\"size\":1,\"query\":{\"bool\":{\"must\":[{\"term\":{\"videoId\":$key7}},{\"range\":{\"timestamp\":{\"gte\":$yesterdaytime,\"lt\":$todaytime}}}]}}}" | jq .hits.hits[0]._source`

key8=`curl -XGET '192.168.1.31:9200/error/error/_search?' -d "{\"size\":0,\"query\":{\"range\":{\"timestamp\":{\"gte\":$yesterdaytime,\"lt\":$todaytime}}},\"aggs\":{\"times\":{\"terms\":{\"field\":\"videoId.keyword\"}}}}" | jq .aggregations.times.buckets[8].key`
content8=`curl -XGET '192.168.1.31:9200/error/error/_search?' -d "{\"size\":1,\"query\":{\"bool\":{\"must\":[{\"term\":{\"videoId\":$key8}},{\"range\":{\"timestamp\":{\"gte\":$yesterdaytime,\"lt\":$todaytime}}}]}}}" | jq .hits.hits[0]._source`

key9=`curl -XGET '192.168.1.31:9200/error/error/_search?' -d "{\"size\":0,\"query\":{\"range\":{\"timestamp\":{\"gte\":$yesterdaytime,\"lt\":$todaytime}}},\"aggs\":{\"times\":{\"terms\":{\"field\":\"videoId.keyword\"}}}}" | jq .aggregations.times.buckets[9].key`
content9=`curl -XGET '192.168.1.31:9200/error/error/_search?' -d "{\"size\":1,\"query\":{\"bool\":{\"must\":[{\"term\":{\"videoId\":$key9}},{\"range\":{\"timestamp\":{\"gte\":$yesterdaytime,\"lt\":$todaytime}}}]}}}" | jq .hits.hits[0]._source`

content=`curl -XGET '192.168.1.31:9200/error/error/_search?' -d "{\"size\":0,\"query\":{\"range\":{\"timestamp\":{\"gte\":$yesterdaytime,\"lt\":$todaytime}}},\"aggs\":{\"times\":{\"terms\":{\"field\":\"videoId.keyword\"}}}}" | jq .aggregations.times.buckets`

echo -e "以下是昨天出错最多的十个:\n" $content "\n\n下面是错误json,用虚线分割\n\n---------------------------------------------------------------------------\n\nvideoId=$key0\n\n" $content0 "\n\n---------------------------------------------------------------------------\n\nvideoId=$key1\n\n" $content1 "\n\n---------------------------------------------------------------------------\n\nvideoId=$key2\n\n" $content2 "\n\n---------------------------------------------------------------------------\n\nvideoId=$key3\n\n" $content3 "\n\n---------------------------------------------------------------------------\n\nvideoId=$key4\n\n" $content4 "\n\n---------------------------------------------------------------------------\n\nvideoId=$key5\n\n" $content5 "\n\n---------------------------------------------------------------------------\n\nvideoId=$key6\n\n" $content6 "\n\n---------------------------------------------------------------------------\n\nvideoId=$key7\n\n" $content7 "\n\n---------------------------------------------------------------------------\n\nvideoId=$key8\n\n" $content8 "\n\n---------------------------------------------------------------------------\n\nvideoId=$key9\n\n" $content9 | mail -s "$yesterday视频出错报表" zhongxin@loocha.com,zhangjinquan@loocha.com,zhangdong123@loocha.com

echo "send mail success"
someday=`date -d " 30  days ago " +%Y-%m-%d`
somedaytime=`date -d $someday +%s000`

curl -XPOST '192.168.1.31:9200/error/error/_delete_by_query?' -d "{\"query\":{\"bool\":{\"must\":{\"range\":{\"timestamp\":{\"gte\":null,\"lt\":$somedaytime}}}}}}"