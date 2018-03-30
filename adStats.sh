#!/bin/sh  

someday=`date -d -1hour +%Y-%m-%d-%H`
someday2=`date -d -1hour +"%Y-%m-%d %H"`
sometime=`date -d "$someday2" +%s%N`
ADVERTLOG=/home/sdc/advert
ADVERTRESULT=/home/sdc/advert/results/
tmp=${ADVERTRESULT}tmp-${someday}.txt

host=(31 6 36)
for h in ${host[@]}; do
	sed -e 's,.*type=,type=,g' -e 's,mm=.*,,g' ${ADVERTLOG}/${h}/source_file/advert.${someday}.log | sort | uniq -c > ${ADVERTRESULT}${someday}-${h}.txt
	insert=${ADVERTRESULT}insert-${someday}.txt
	rm ${insert}
	rm ${tmp}
	while read a;
	do
	        c=`echo $a | awk '{print $1}'`;
	        type=`echo $a | awk '{print $2}' | sed -e 's,\,id=.*,,g' -e 's,type=,,g'`;
	        id=`echo $a | awk '{print $2}' | sed -e 's,.*id=,,g' -e 's,\,operation=.*,,g'`;
	        operation=`echo $a | awk '{print $2}' | sed -e 's,.*operation=,,g' -e 's,\,,,g'`;
	        if [[ "${id}" =~ ^[0-9]+$ ]]; then
	        	if [ ${id} -gt 100000 ]; then
	        		for ((i=0; i < ${c};i ++)); do
	        			echo "advertHours,type=${type},operation=${operation},id=0" >> ${tmp}
		        	done
	        		continue
	        	fi
	        else
	        	id=-1
	        	for ((i=0; i < ${c};i ++)); do
	        			echo "advertHours,type=${type},operation=${operation},id=-1" >> ${tmp}
		        done
	        	continue
	        fi
	        echo "advertHours,type=${type},operation=${operation},id=${id},host=${h} count=${c} $sometime" >> ${insert}
	done < ${ADVERTRESULT}${someday}-${h}.txt

	cat ${tmp} | sort | uniq -c | while read a; do
		c=`echo $a | awk '{print $1}'`;
		d=`echo $a | awk '{print $2}'`;
		echo "$d,host=${h} count=${c} $sometime" >> ${insert}
	done
	rm ${tmp}
curl -i -XPOST 'http://localhost:8086/write?db=stat' -u test:test --data-binary @${insert}
done