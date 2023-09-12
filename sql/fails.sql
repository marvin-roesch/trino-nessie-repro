CREATE SCHEMA IF NOT EXISTS iceberg.default;

CREATE TABLE IF NOT EXISTS iceberg.default.example (column int);
CREATE TABLE IF NOT EXISTS iceberg.default.example_tmp (column int);

DROP TABLE IF EXISTS iceberg.default.example_backup;

ALTER TABLE iceberg.default.example RENAME TO iceberg.default.example_backup;
ALTER TABLE iceberg.default.example_tmp RENAME TO iceberg.default.example;
DROP TABLE iceberg.default.example_backup;
