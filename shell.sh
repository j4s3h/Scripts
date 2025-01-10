#!/bin/bash

# Variables
BACKUP_FILE="db.backup"      # Name of the .backup file
DB_NAME="your_database"      # Name of the target database
DB_USER="your_user"          # PostgreSQL username
DB_HOST="localhost"          # PostgreSQL host
DB_PORT="5432"               # PostgreSQL port

# Restore the database
echo "Restoring the database from $BACKUP_FILE to $DB_NAME..."

pg_restore --host="localhost" \
           --port="5432" \
           --username="postgres" \
           --dbname="name_db" \
           --clean --no-owner "$BACKUP_FILE"

if [ $? -eq 0 ]; then
    echo "Database restored successfully."
else
    echo "Failed to restore the database."
    exit 1
fi


