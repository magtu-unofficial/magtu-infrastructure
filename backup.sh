#!/bin/sh
cd $(dirname "$0")

docker-compose exec mongo mongodump -o=/data/db/dump
tar -czvf dump.tar.gz ./data-db/dump
rm -r ./data-db/dump
scp -i /home/ivan/.ssh/id_rsa dump.tar.gz ivan@192.168.3.20:/zp0/backups/magtu/magtu-mongo-$(date +"%Y-%m-%d").tar.gz
rm dump.tar.gz
