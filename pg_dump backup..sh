#!/bin/bash
# Define variables
USERNAME="postgres"
PASSWORD="password"
HOST="localhost" # or your remote host
PORT="5432"
DATABASE="example_db"
OUTPUT_FILE="/home/sysadmin/backup/db.backup"

# Export password to avoid prompt
export PGPASSWORD=$PASSWORD

# Perform the backup
pg_dump -U $USERNAME -h $HOST -p $PORT -F c -b -v -f $OUTPUT_FILE $DATABASE
# Unset the password variable
unset PGPASSWORD

echo "Backup completed and saved to $OUTPUT_FILE"

