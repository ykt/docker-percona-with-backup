# docker-percona-with-backup

> Using https://github.com/klevo/docker-percona/ as base image, this will add backup mechanism.


## Getting Started

### Mandatory Docker System Environment

Refer to `docker-compose.yml` for example.

- `AWS_ACCESS_KEY`: AWS Access Key to be used when uploading backups to S3 bucket
- `AWS_SECRET_KEY`: AWS Secret Key to be used when uploading backups to S3 bucket
- `MYSQL_ROOT_PASSWORD`: Root password for MySQL
- `S3BUCKET`: Location of the S3 backup. For eg: `s3://a-sample-bucket/some/database/backuppath/`

### Optional Docker System Environment

- `INNOBACKUPEX_MEMORY`: Amount of memory allocated for restoring process. Defaulted to `1024M`.
- `BACKUPDIR`: Location of the backup in the container. Defaulted to `/backup/mysql`.

## Backup Behaviour

    TODO

## Restore Process (Must be done within the container)

- If the Docker container is totally destroyed, copy from S3 backup path `S3BUCKET` into `BACKUPDIR` directory in the container.

    s3cmd cp $S3BUCKET $BACKUPDIR

- `rm -rf /var/lib/mysql/*`

- Run `innobackupex-restore`, specifying the first parameter from the targetted backup. This can be either full or incremental backup.

    innobackupex-restore $BACKUPDIR/full/2015-03-17_07-59-45/
    innobackupex-restore $BACKUPDIR/incr/2015-03-17_07-59-45/2015-03-17_06-43-18/
