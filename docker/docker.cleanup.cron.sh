#!/bin/bash
tmp_file="docker.cleanup.cron"
crontab -l > $tmp_file

# echo new cron into cron file
# 12:00 every Monday
echo "0 12 * * 1 docker system prune -f --volumes" >> $tmp_file

# install new cron file
crontab $tmp_file
# remove tmp
rm $tmp_file
# list tasks
crontab -l