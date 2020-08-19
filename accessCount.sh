day=$(date +"%Y-%m-%d" -d "-1 days")
grep "app/access" /opt/iwhalecloud/logs/property-management-business/logs/access_log."${day}".log | grep "POST" | awk '{print $(NF-1)}' | uniq -c >/opt/scripts/today.txt
sql=''
while read -r line; do
  count=$(echo "${line}" | awk '{print $1}')
  userId=$(echo "${line}" | awk '{print $2}')
  sql+="insert into access_count (user_id,count,date) values ('$userId','$count','$day') on duplicate key update count=count+values(count);"
done </opt/scripts/today.txt
if [ "${sql}" != '' ]; then
  mysql -uuser -ppassword -Dic_property -e "${sql}"
fi
