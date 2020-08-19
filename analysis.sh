day=$(date +"%Y-%m-%d" -d "-1 days")
grep "/app/home" /opt/iwhalecloud/logs/property-management-business/logs/access_log."${day}".log | awk '{print $(NF-1),$NF}' | uniq -c >/opt/scripts/analysis.txt
while read -r line; do
  userId=$(echo "${line}" | awk '{print $2}')
  communityId=$(echo "${line}" | awk '{print $3}')
  sql+="insert ignore into active_user (user_id,community_id,date) values ('$userId','$communityId','$day');"
done </opt/scripts/analysis.txt
mysql -uuser -ppassword -Dic_property -e "${sql}"
