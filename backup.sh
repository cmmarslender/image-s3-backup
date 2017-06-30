#!/bin/bash

THEDATE=`date +%d%m%y%H%M`

# Delay execution if set in environment
sleep ${BACKUP_OFFSET:-0}

mysqldump --single-transaction -h ${DB_HOST} -u ${DB_USER} -p${DB_PASS} ${DB_NAME} | gzip > /var/www/_backups/dbbackup_${SITE_NAME}_${THEDATE}.sql.gz

tar -pczf /var/www/_backups/sitebackup_${SITE_NAME}_${THEDATE}.tar.gz /var/www/html

# Syncs the directory to S3!
/usr/bin/aws s3 mv --recursive /var/www/_backups/ s3://${AWS_BUCKET}/${SITE_NAME}/
