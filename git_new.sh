#!/bin/bash

startdate=2018-07-10
enddate=2018-07-20

sDateTs=`date -j -f "%Y-%m-%d" $startdate "+%s"`
eDateTs=`date -j -f "%Y-%m-%d" $enddate "+%s"`
dateTs=$sDateTs
offset=86400

while [ "$dateTs" -le "$eDateTs" ]
do
  date=`date -j -f "%s" $dateTs "+%Y-%m-%d"`
  rand=$(((RANDOM % 5) + 1))
        for j in $(seq 1 $rand)
        do
            git add .
            git commit --date="$date" -m "Contribution" --allow-empty 
            printf '%s\n' $date
            dateTs=$(($dateTs+$offset))
        done
done

git push -u origin master
