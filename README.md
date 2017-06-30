### Environment Variables

Required:
* `SITE_NAME` - Name of the site - used in the filenames for the backups
* `DB_HOST` - Hostname of the database server that contains the database to backup
* `DB_NAME` - Name of the database to backup
* `DB_USER` - User that has access to the database to backup
* `DB_PASS` - Password of the user to the database to backup
* `AWS_ACCESS_KEY_ID` - Access Key ID for the AWS Bucket. Recommend write only, no delete or modify. 
* `AWS_SECRET_ACCESS_KEY` - Access Key Secret for the AWS Bucket.
* `AWS_BUCKET` - S3 bucket to backup the site to

Optional:
* `BACKUP_OFFSET` = If provided, the backup script will wait this many seconds to start the backup. Useful if you have 
many instances of this container running on the same hardware. 

### Instructions
Mount the directory you wish to back up (generally the site root) to `/var/www/html`. The backup will be automatically
daily.
