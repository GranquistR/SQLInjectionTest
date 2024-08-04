#!/bin/sh
# Start SQL Server
/opt/mssql/bin/sqlservr &

# Wait for the SQL Server to come up
until /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P 'MyStrong!Passw0rd' -Q "SELECT 1" -C; do
sleep 1
done

# Run the setup script to create the DB and the schema in the DB
/opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P 'MyStrong!Passw0rd' -i init.sql -C

# Keep the container running
wait