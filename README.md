# Reproduction of projectnessie/nessie#7492

This is a minimal Trino/Iceberg/Nessie setup to exemplify a bug with renaming tables in Nessie. It only requires `docker-compose` to be installed.

Start the services with `docker-compose up` and then execute the following command to demonstrate the issue:
```bash
docker-compose exec trino trino --file /var/run/sql/fails.sql
```
Executing the following, however, succeeds:
```bash
docker-compose exec trino trino --file /var/run/sql/succeeds.sql
```

The only difference between `fails.sql` and `succeeds.sql` is the order of operations. The former first renames both tables and then drops the backup, the latter drops the backup before renaming the temporary table to the original name.

Theoretically, there should not be a difference in end result with these two sequences of queries. At the time the temporary table is renamed, no table with name matching the original exists anymore and thus should not conflict.
