USE default;

DROP TABLE IF EXISTS datasource3;
DROP TABLE IF EXISTS datasource4;

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

CREATE EXTERNAL TABLE datasource4 (
  restaurant_id STRING,
  name STRING,
  city STRING,
  country STRING,
  cuisine STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '${hiveconf:input_dir4}'
TBLPROPERTIES ("skip.header.line.count"="1");

INSERT OVERWRITE DIRECTORY '${hiveconf:output_dir6}'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
SELECT
  concat(
    '{"country":"', regexp_replace(country, '"', ''), '",',
    '"cuisine":"', regexp_replace(cuisine, '"', ''), '",',
    '"total_orders":', CAST(total_orders AS STRING), ',',
    '"avg_total_price":', CAST(avg_total_price AS STRING), ',',
    '"rank_in_country":', CAST(rank_in_country AS STRING), '}'
  ) AS json_output
FROM (
  SELECT
    country,
    cuisine,
    total_orders,
    avg_total_price,
    ROW_NUMBER() OVER (PARTITION BY country ORDER BY total_orders DESC) AS rank_in_country
  FROM (
    SELECT
      r.country,
      r.cuisine,
      SUM(s.total_orders) AS total_orders,
      ROUND(
        SUM(s.total_orders * s.avg_total_price) / SUM(s.total_orders),
        2
      ) AS avg_total_price
    FROM datasource3 s
    INNER JOIN datasource4 r ON s.restaurant_id = r.restaurant_id
    GROUP BY r.country, r.cuisine
  ) aggregated
) ranked
ORDER BY country, rank_in_country;
