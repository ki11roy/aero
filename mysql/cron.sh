#!/bin/sh

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

cp csv2json.pl /usr/bin

mkdir /usr/bin/air
cp update.sh /usr/bin/air

#write out current crontab
crontab -l > mycron
#echo new cron into cron file
echo "00 09 * * 0-7 setuidgid air /usr/bin/air/update.sh" >> mycron
#install new cron file
crontab mycron
rm mycron
