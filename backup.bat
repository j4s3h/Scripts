@echo off
setlocal

REM Define variables
set HOST=localhost
set PORT=5432
set USERNAME=postgres
set DBNAME=DB_TEST_DUMP
set BACKUPFILE=D:\Backup\db.backup

REM Run pg_restore command
pg_restore --host "%HOST%" --port "%PORT%" --username "%USERNAME%" --dbname "%DBNAME%" --verbose "%BACKUPFILE%"

endlocal