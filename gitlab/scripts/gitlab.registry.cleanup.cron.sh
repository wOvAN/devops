#!/bin/bash
tmp_file="gitlab.registry.cleanup.cron"
crontab -l > $tmp_file

echo "0 11 * * 1 docker exec -it gitlab gitlab-ctl registry-garbage-collect >> /var/log/registry-garbage-collect.log" >> $tmp_file

# install new cron file
crontab $tmp_file
# remove tmp
rm $tmp_file
# list tasks
crontab -l