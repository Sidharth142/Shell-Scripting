#!/bin/bash 
tr=90

for i in `df -h | awk '{print $6}'`
do
cur_value=`df -h | awk '{print $5}' | sed 's/%//'`
if [ $cur_value -gt tr ]
then
files=`find $i -mtime +30`
tar -cvf $bkup/$i_`date +%d-%m-%y`.tar  $files

if [ $? -eq  0  ]
then
   cd  $i
rm -rf  $files
fi
fi
done