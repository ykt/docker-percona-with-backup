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