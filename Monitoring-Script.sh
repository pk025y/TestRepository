#!/bin/bash
#DAILY MONITORING SCRIPT
HOSTNAME=`hostname`
FILENAME=Scripts/Daily_Monitoring/$HOSTNAME.`date “+%m%d%Y%H%M”`.txt
DATE=`date “+%b-%d-%Y-%H:%M”`
RECIEPIENT=”ABC@XYZ.com”
echo “Hostname –>” $HOSTNAME >> $FILENAME
echo ”  ” >> $FILENAME
echo “Date and Time –>” $DATE >> $FILENAME
echo ”  ” >> $FILENAME
echo ”                                  MEMORY STATUS” >> $FILENAME
echo ”  ” >> $FILENAME
free -m >> $FILENAME
echo ”  ” >> $FILENAME
echo ”                                  DISK FREE STATUS” >> $FILENAME
echo ”  ” >> $FILENAME
df -h >> $FILENAME
echo ”                                  DISK USAGE STATUS” >> $FILENAME
echo ”  ” >> $FILENAME
du -sh >> $FILENAME
echo ”                                  DISK USAGE STATUS OF /OPT/TIBCO/” >> $FILENAME
echo ”  ” >> $FILENAME
du -sh /opt/mis/apps/tibco/ >> $FILENAME
echo ”                                  PROCESS MONITORING STATUS” >> $FILENAME
echo ”  ” >> $FILENAME
top -b -n 1 -u tibcoprd >> $FILENAME
echo ”                                  OVERALL CPU STATUS” >> $FILENAME
echo ”  ” >> $FILENAME
ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10 >> $FILENAME
echo ”  ” >> $FILENAME
echo ”                         TIBCO Admin RUNNING STATUS” >> $FILENAME
echo ”  ” >> $FILENAME
ps -eaf |grep -v grep | grep “tibcoadmin” >> $FILENAME
echo ”  ” >> $FILENAME
ps -ef | grep -v grep | grep “tibcoadmin” > /dev/null
if [ $? -ne 0 ]; then
echo “TIBCO admin Is Not Running, Please Check” >> $FILENAME
else
echo “TIBCO admin Is Running Fine” >> $FILENAME
fi
