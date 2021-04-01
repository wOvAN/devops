#!/bin/bash
tmp_file="ubuntu.update.cron"
crontab -l > $tmp_file

# echo new cron into cron file
# 12:00 every Monday
echo "0 12 * * 1 apt update ; apt upgrade -y >> /var/log/apt-update-cron.log" >> $tmp_file

# install new cron file
crontab $tmp_file
# remove tmp
rm $tmp_file
# list tasks
crontab -l