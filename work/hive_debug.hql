-- hive_debug.hql - Diagnostyka danych
USE default;

DROP TABLE IF EXISTS datasource3;
DROP TABLE IF EXISTS restaurants;

-- Tabela datasource3
CREATE EXTERNAL TABLE datasource3 (
  restaurant_id STRING,
  payment_type STRING,
  total_orders INT,
  avg_total_price DOUBLE
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE
LOCATION '${hiveconf:input_dir3}';

-- Tabela restaurants
CREATE EXTERNAL TABLE restaurants (
  restaurant_id STRING,
  name STRING,
  city STRING,
  country STRING,
  cuisine STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  "separatorChar" = ",",
  "quoteChar"     = "\""
)
STORED AS TEXTFILE
LOCATION '${hiveconf:input_dir4}'
TBLPROPERTIES ("skip.header.line.count"="1");

-- DIAGNOSTYKA
SELECT '=== Liczba rekordów w datasource3 ===' AS info;
SELECT COUNT(*) as count FROM datasource3;

SELECT '=== Przykładowe restaurant_id z datasource3 ===' AS info;
SELECT DISTINCT restaurant_id FROM datasource3 LIMIT 5;

SELECT '=== Liczba rekordów w restaurants ===' AS info;
SELECT COUNT(*) as count FROM restaurants;

SELECT '=== Przykładowe restaurant_id z restaurants ===' AS info;
SELECT DISTINCT restaurant_id FROM restaurants LIMIT 5;

SELECT '=== Przykładowe dane z restaurants ===' AS info;
SELECT * FROM restaurants LIMIT 5;

-- Test JOIN
SELECT '=== Test JOIN - liczba dopasowań ===' AS info;
SELECT COUNT(*) as matched_count
FROM datasource3 s
JOIN restaurants r ON s.restaurant_id = r.restaurant_id;

-- Sprawdź czy są rekordy które się NIE łączą
SELECT '=== Restaurant ID które NIE mają dopasowania ===' AS info;
SELECT DISTINCT s.restaurant_id
FROM datasource3 s
LEFT JOIN restaurants r ON s.restaurant_id = r.restaurant_id
WHERE r.restaurant_id IS NULL
LIMIT 10;
