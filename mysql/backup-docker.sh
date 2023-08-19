#!/bin/bash

set -e

CONTAINER_NAME="mariadb"

BACKUP_DIR="backup"

now=$(date +%Y_%m_%d__%H_%M)
OUT_FILE="backup_${now}.sql"

RAW_SQL_FILES_TO_KEEP=1
DAYS_TO_KEEP_BACKUPS=30

pushd "$(dirname "$0")" > /dev/null

docker exec \
    $CONTAINER_NAME \
    sh -c 'exec mariadb-dump --all-databases -uroot -p"$MARIADB_ROOT_PASSWORD"' \
    > "${BACKUP_DIR}/${OUT_FILE}"

tar -zcf "${BACKUP_DIR}/${OUT_FILE}.tgz" -C "$BACKUP_DIR" "$OUT_FILE"

# delete old files
find "$BACKUP_DIR" -name "backup_*.sql" -type f \
    | sort \
    | head -n -$RAW_SQL_FILES_TO_KEEP \
    | xargs -I{} rm -f {} \

find "$BACKUP_DIR" -name "backup_*.tgz" -ctime +$DAYS_TO_KEEP_BACKUPS -type f \
    | xargs -I{} rm -f {} \

popd > /dev/null
