#!/bin/bash

#################################################################################
# Written by: Alessio Giuseppe Manfrè
# Name: BlazingDIFR.sh
# email: alessiogiuseppemanfre@gmail.com
# # DETAILS # #
# This script has the task of extracting artifacts useful for malware analysis in an infected linux system.
# This script has been developed under license to Yarix Srl for internal Team IR activities. 
# However, this script is open source and you are free to replace or improve it.
#################################################################################

##### DECLARE STARTING OPERATIONS #####
SLEEP_TIME="1s"
mkdir -p $(hostname)

##### STARTING OPERATIONS MESSAGE #####
sleep ${SLEEP_TIME}
echo BlazingDIFR is now running...
{
echo -e '##### BLAZINGDFIR START DATE #####' > startdate.txt | echo && date > startdate.txt
} &> /dev/null
echo
sleep ${SLEEP_TIME}

##### SYSTEM INFOS DATA #####
echo Dump operations for system infos data in progress...
sleep ${SLEEP_TIME}
{
echo -e '##### HOSTNAME #####' > systeminfos.txt | echo && hostname >> systeminfos.txt
echo -e '\n##### WHOAMI #####' >> systeminfos.txt | echo && whoami >> systeminfos.txt
echo -e '\n##### LOGNAME #####' >> systeminfos.txt | echo && logname >> systeminfos.txt
echo -e '\n##### PROC VERSION #####' >> systeminfos.txt | echo && cat /proc/version >> systeminfos.txt
echo -e '\n##### UNAME #####' >> systeminfos.txt | echo && uname -a >> systeminfos.txt
echo -e '\n##### UPTIME #####' >> systeminfos.txt | echo && uptime >> systeminfos.txt
echo -e '\n##### ID #####' >> systeminfos.txt | echo && id >> systeminfos.txt
echo -e '\n##### CPU INFO #####' >> systeminfos.txt | echo && cat /proc/cpuinfo >> systeminfos.txt
echo -e '\n##### ARP CACHE #####' >> systeminfos.txt | echo && arp -a >> systeminfos.txt
echo -e '\n##### WHO #####' >> systeminfos.txt | echo && who >> systeminfos.txt
echo -e '\n##### W #####' >> systeminfos.txt | echo && w >> systeminfos.txt
echo -e '\n##### USERS #####' >> systeminfos.txt | echo && users >> systeminfos.txt
echo -e '\n##### PRINTENV #####' >> systeminfos.txt | echo && printenv >> systeminfos.txt
echo -e '\n##### VERSION #####' >> systeminfos.txt | echo && cat /proc/version >> systeminfos.txt
echo -e '\n##### IFCONFIG #####' >> systeminfos.txt | echo && ifconfig >> systeminfos.txt
echo -e '\n##### GREP ROOT #####' >> systeminfos.txt | echo && pgrep -U root >> systeminfos.txt
echo -e '\n##### PROC MODULES #####' >> systeminfos.txt | echo && cat /proc/modules >> systeminfos.txt
echo -e '\n##### XCLIP #####' >> systeminfos.txt | echo && xclip -o >> systeminfos.txt
echo -e '\n##### CMD LINE (Kernel Boot) #####' >> systeminfos.txt | echo && cat /proc/cmdline >> systeminfos.txt
echo -e '\n##### TOP #####' >> systeminfos.txt | echo && top -n 1 -b >> systeminfos.txt
echo -e '\n##### CHKCONFIG LIST (RedHat) #####' >> systeminfos.txt | echo && chkconfig -list >> systeminfos.txt
echo -e '\n##### SERVICE STATUS #####' >> systeminfos.txt | echo && service --status-all >> systeminfos.txt
} &> /dev/null 
echo -e "\e[0;32mSystem infos data gathered!\e[0;37m"
sleep ${SLEEP_TIME}

##### PROCESS STATUS INFOS #####
echo Dump operations for process status infos data in progress...
sleep ${SLEEP_TIME}
{
echo -e '##### PROCESS STATUS TREEE #####' > psinfos.txt  | echo && pstree -a >> psinfos.txt
echo -e '\n##### PROCESS STATUS (-e) #####' >> psinfos.txt | echo && ps -e >> psinfos.txt
echo -e '\n##### PROCESS STATUS (-ef) #####' >> psinfos.txt | echo && ps -ef >> psinfos.txt
echo -e '\n##### PROCESS STATUS (-aux) #####' >> psinfos.txt | echo && ps -aux >> psinfos.txt
echo -e '\n##### PROCESS STATUS (-eafww) #####' >> psinfos.txt | echo && ps -eafww >> psinfos.txt
echo -e '\n##### PROCESS STATUS (-auxww) #####' >> psinfos.txt | echo && ps -auxww >> psinfos.txt
echo -e '\n##### PROCESS STATUS (-U root) #####' >> psinfos.txt | echo && ps -u root >> psinfos.txt
} &> /dev/null 
echo -e "\e[0;32mProcess status infos data gathered!\e[0;37m"
sleep ${SLEEP_TIME}

##### NETWORK STATUS INFOS #####
echo Dump operations for network status infos data in progress...
sleep ${SLEEP_TIME}
{
echo -e '##### NETSTAT NAOVP #####' > netinfos.txt | echo && netstat -naovp >> netinfos.txt
echo -e '\n##### NETSTATS NR (Routing Table) #####' >> netinfos.txt | echo && netstat -nr >> netinfos.txt
} &> /dev/null 
echo -e "\e[0;32mNetwork status infos data gathered!\e[0;37m"
sleep ${SLEEP_TIME}

##### USEFUL ARTIFACTS INFOS #####
echo Dump operations for useful artifacts infos data in progress...
sleep ${SLEEP_TIME}
{
echo -e '##### MOUNTS #####' > artifacts.txt | echo && cat /proc/mounts >> artifacts.txt
echo -e '\n##### FSTAB #####' >> artifacts.txt | echo && cat /etc/fstab >> artifacts.txt
echo -e '\n##### EXPORTS #####' >> artifacts.txt | echo && cat /etc/exports >> artifacts.txt #NFS exported dir's
echo -e '\n##### SAMBA #####' >> artifacts.txt | echo && cat /etc/samba/smb.conf >> artifacts.txt #Samba Exports
} &> /dev/null 
echo -e "\e[0;32mUseful artifacts infos data gathered!\e[0;37m"
sleep ${SLEEP_TIME}

##### IP TABLES INFOS #####
echo Dump operations for iptables infos data in progress...
sleep ${SLEEP_TIME}
{
echo -e '\n##### IPTABLES NAT #####' > iptables.txt | echo && iptables -t nat -nL >> iptables.txt
echo -e '\n##### IPTABLES MANGLE #####' >> iptables.txt | echo && iptables -t mangle -nL >> iptables.txt
echo -e '\n##### IPTABLES FILTER #####' >> iptables.txt | echo && iptables -t filter -nL >> iptables.txt
echo -e '\n##### IPTABLES RAW #####' >> iptables.txt | echo && iptables -t raw -nL >> iptables.txt
} &> /dev/null 
echo -e "\e[0;32mIptables infos data gathered!\e[0;37m"
sleep ${SLEEP_TIME}

##### ADDITIONAL LS INFOS #####
echo Dump operations for additional ls infos data in progress...
sleep ${SLEEP_TIME}
{
echo -e '##### LSOF #####' > lsinfos.txt | echo && lsof -l >> lsinfos.txt
echo -e '\n##### LSMOD #####' >> lsinfos.txt | echo && lsmod >> lsinfos.txt
} &> /dev/null 
echo -e "\e[0;32mAdditional ls infos data gathered!\e[0;37m"
sleep ${SLEEP_TIME}

##### CRON JOBS INFOS #####
echo Dump operations for cron jobs infos data in progress...
sleep ${SLEEP_TIME}
{
echo -e '##### CRONTAB -L #####' > croninfos.txt | echo && crontab -l >> croninfos.txt
echo -e '\n##### CRONTAB INFO #####' >> croninfos.txt | echo && cat /etc/crontab >> croninfos.txt
echo -e '\n##### MORE CRONTAB INFO #####' >> croninfos.txt | echo && more /etc/crontab >> croninfos.txt
echo -e '\n##### SPOOL CRONTAB #####' >> croninfos.txt | echo && ls -la /var/spool/cron/crontab >> croninfos.txt
echo -e '\n##### SPOOL ATJOBS #####' >> croninfos.txt | echo && ls -la /var/spool/cron/atjobs >> croninfos.txt
echo -e '\n##### SPOOL ATSPOOL #####' >> croninfos.txt | echo && ls -la /var/spool/cron/atspool >> croninfos.txt
echo -e '\n##### CRON HOURLY #####' >> croninfos.txt | echo && ls /etc/cron.hourly >> croninfos.txt
echo -e '\n##### CRON DAILY #####' >> croninfos.txt | echo && ls /etc/cron.daily >> croninfos.txt
echo -e '\n##### CRON WEEKLY #####' >> croninfos.txt | echo && ls /etc/cron.weekly >> croninfos.txt
echo -e '\n##### CRON MONTHLY #####' >> croninfos.txt | echo && ls /etc/cron.monthly >> croninfos.txt
echo -e '\n##### CRON ALLOW #####' >> croninfos.txt | echo && cat /etc/cron.allow >> croninfos.txt
echo -e '\n##### CRON DENY #####' >> croninfos.txt | echo && cat /etc/cron.deny >> croninfos.txt
echo -e '\n##### HOST EQUIV #####' >> croninfos.txt | echo && cat /etc/hosts.equiv >> croninfos.txt
echo -e '\n##### HOST LPD #####' >> croninfos.txt | echo && cat /etc/hosts.lpd >> croninfos.txt
echo -e '\n##### RHOST #####' >> croninfos.txt | echo && .rhosts >> croninfos.txt
echo -e '\n##### X0 HOSTS #####' >> croninfos.txt | echo && cat /etc/X0.hosts >> croninfos.txt
echo -e '\n##### CRON ALL #####' >> croninfos.txt | echo && ls /etc/cron.* >> croninfos.txt
echo -e '\n##### VAR ATJOBS #####' >> croninfos.txt | echo && ls /var/at/jobs >> croninfos.txt
echo -e '\n##### ANACRONTAB #####' >> croninfos.txt | echo && cat /etc/anacrontab >> croninfos.txt
} &> /dev/null 
echo -e "\e[0;32mCron jobs infos data gathered!\e[0;37m"
sleep ${SLEEP_TIME}

##### SOLARIS ADDITIONAL INFOS #####
echo Dump operations for solaris additional infos data in progress...
sleep ${SLEEP_TIME}
{
echo -e '##### SOLARIS #####' > solarisinfos.txt | echo && ls /etc/rc*.d >> solarisinfos.txt
echo -e '\n##### SOLARIS 10+ #####' >> solarisinfos.txt | echo && smf >> solarisinfos.txt
} &> /dev/null 
echo -e "\e[0;32mSolaris additional infos data gathered!\e[0;37m"
sleep ${SLEEP_TIME}

#### ADDITIONAL INFOS ####
echo Dump operations for additional infos data in progress...
sleep ${SLEEP_TIME}
{
echo -e '##### LAST #####' > addinfos.txt | echo && last >> addinfos.txt
echo -e '\n##### LASTLOG #####' >> addinfos.txt | echo && lastlog >> addinfos.txt
echo -e '\n##### SYSLOG CONF #####' >> addinfos.txt | echo && cat /etc/syslog.conf >> addinfos.txt
echo -e '\n##### SYSLOG NG CONF #####' >> addinfos.txt | echo && cat /etc/syslog-ng/syslog-ng.conf >> addinfos.txt
echo -e '\n##### NEWERMT 7 DAYS #####' >> addinfos.txt | echo && find -newermt '7 day ago' >> addinfos.txt
echo -e '\n##### NEWERMT 1 MOUNTH #####' >> addinfos.txt | echo && find . -type f -atime +30 -print >> addinfos.txt
echo -e '\n##### VA #####' >> addinfos.txt | echo && rpm -Va >> addinfos.txt
echo -e '\n##### PKGCHK #####' >> addinfos.txt | echo && pkgchk >> addinfos.txt
echo -e '\n##### DPKG #####' >> addinfos.txt | echo && dpkg -l >> addinfos.txt
echo -e '\n##### DEBSUMS #####' >> addinfos.txt | echo && debsums >> addinfos.txt
echo -e '\n##### BASH HISTORY #####' >> addinfos.txt | echo && .bash_history >> addinfos.txt
echo -e '\n##### SH HISTROY #####' >> addinfos.txt | echo && .sh_history >> addinfos.txt
echo -e '\n##### HISTORY #####' >> addinfos.txt | echo && .history >> addinfos.txt
echo -e '\n##### ORPHAN FILES #####' >> addinfos.txt | echo && find / -nouser -print >> addinfos.txt #Find orphan files (this command change file access time)
echo -e '\n##### SHADOW #####' >> addinfos.txt | echo && awk -F: '($2 == "") {print $1}' /etc/shadow >> addinfos.txt
echo -e '\n##### PASSWD LESS #####' >> addinfos.txt | echo && sort -nk3 -t: /etc/passwd | less >> addinfos.txt
echo -e '\n##### PASSWD SORT #####' >> addinfos.txt | echo && cut -f3 -d: /etc/passwd | sort -n | uniq -c | awk '!/ 1 / {print $2}' >> addinfos.txt
echo -e '\n##### PASSWD EGREP #####' >> addinfos.txt | echo && awk -F: '($3 == 0) {print $1}' /etc/passwd egrep ':0+:' /etc/passwd >> addinfos.txt
#echo -e '\n##### ... #####' >> addinfos.txt | echo && cp /var/log/*tmp* ./var_logs_tmp >> addinfos.txt
#echo -e '\n##### ... #####' >> addinfos.txt | echo && cp -R /var/log*  ./var_logs >> addinfos.txt
} &> /dev/null 
echo -e "\e[0;32mAdditional infos data gathered!\e[0;37m"
sleep ${SLEEP_TIME}

##### CLEANING DUPLICATES AND REMOVE EMPTY FILE #####
mv *.txt ./$(hostname)
find ./$(hostname) -size 0 -delete

##### FINAL OPERATIONS MESSAGE #####
sleep ${SLEEP_TIME}
echo
echo -e "\e[0;32mBlazingDIFR operations complete! Wait for $(hostname) folder open...\e[0;37m"
sleep ${SLEEP_TIME}