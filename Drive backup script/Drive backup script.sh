#!/bin/bash
tgt="/oracle/db"
bkup="/drive/bkup"
dt=`date +%d-%m-%y`
cd $tgt
count=`ls -l | sed -n '1!p' | wc -l'
tar -cvf $bkup/orabkup_$dt.tar * >/tmp/body.txt 2&>1
sr=`echo $?`
tarcnt=`tar -tvf $bkup/orabkup_$dt.tar | wc -l`
if [ $sr -eq 0 ] && [ $tarcnt -eq $count ]
then 
   cd $tgt
    rm -rf *
    mail -s "bkup sucess and clean up done" d1@cts.com </tmp/body.txt
else
    mail -s "backup fail clean up has not done" d1@cts.com </tmp/body.txt
fi
