#!/bin/bash

#################################################################################
# Written by: Alessio Giuseppe Manfrè
# Name: BlazingDIFR.sh
# email: alessiogiuseppemanfre@gmail.com
# # DETAILS # #
# This script is tasked with extracting multiple IPs from a messy dataset. 
# After that, it will generate a file with the reputation of the IPs.
# This script has been developed under license to Yarix Srl for internal Team IR activities. 
# However, this script is open source and you are free to replace or improve it.
#################################################################################

##### DECLARE STARTING OPERATIONS #####
SLEEP_TIME="1s"
mkdir -p Data
cd ./Data

##### STARTING OPERATIONS MESSAGE #####
sleep ${SLEEP_TIME}
echo IPInfoCollector is now running...
echo
sleep ${SLEEP_TIME}

##### PRELIMINARY INSTALL OPERATIONS #####
echo Start of install curl service...
sleep ${SLEEP_TIME}
{
apt install curl
} &> /dev/null 
echo -e "\e[0;32mcurl service is ready!\e[0;37m"
sleep ${SLEEP_TIME}
echo Start of install net-tools service...
{
apt install net-tools
} &> /dev/null 
echo -e "\e[0;32mnet-tools service is ready!\e[0;37m"
sleep ${SLEEP_TIME}
echo Start of install dos2unix service...
{
apt install dos2unix
} &> /dev/null 
echo -e "\e[0;32mdos2unix is ready!\e[0;37m"
sleep ${SLEEP_TIME}

### PHASE ONE ##
echo
echo "Place (and rename, if necessary) the 'import.csv' file in the Data folder. Then click on 'Yes' to go on. If you don't move the 'import.csv' file on 'Data' folder, select 'No' to exit."
select yn in "Yes" "No"; do
	case $yn in
		Yes ) 	sleep ${SLEEP_TIME}
				exec 2> /dev/null
				echo IP extraction from CSV dataset in progress...
				grep -E -o '(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)' import.csv > export.csv;
				break;;
		No ) 	sleep ${SLEEP_TIME}
				exec 2> /dev/null
				echo -e "\e[0;33mThanks for using IPInfoCollector! Be sure to place the file in the 'Data' folder and, if necessary, rename it to 'import.csv' so that you can proceed with the operations.\e[0;37m"
				exit; 
				break;;
	esac
done

### PHASE TWO ###
sleep ${SLEEP_TIME}
echo Removing duplicates from export.csv in progress...
{
sort -u export.csv -o export.csv
} &> /dev/null

### PHASE THREE ##
sleep ${SLEEP_TIME}
echo Start of export operations... It may take some time
xargs cat <export.csv
for fn in `cat export.csv`; do
    echo $fn
	url="https://ipinfo.io/$fn?token=ae60ed3e525708"
    curl $url
done > export.json

### PHASE FOUR ##
echo && cat export.json | grep -Poz '{?{[^{}]+}}?' >> results.json
sed -i 's/\x0//g' results.json
sed -i -e 's/}/},\n/g' results.json
sed -i "1i [" results.json
sed -i -e '$i }' results.json
sed -i "\$d" results.json
sed -i -e '$a ]' results.json
jq -r '.[] | [.ip, .hostname, .country, .name, .domain, .type, .vpn, .tor] | @csv' results.json >> results.csv

### PHASE FIVE ###
sleep ${SLEEP_TIME}
echo -e "\e[0;32mIPInfoCollector operations complete!\e[0;37m"
sleep ${SLEEP_TIME}

##### CLEANING DUPLICATES AND REMOVE EMPTY FILE #####
mv *.csv ./Data
find ./Data -size 0 -delete