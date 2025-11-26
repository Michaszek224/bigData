DROP TABLE food_orders_ext;
DROP TABLE restaurants_ext;
DROP VIEW cuisines;
DROP VIEW cuisines_ranked;


CREATE EXTERNAL TABLE IF NOT EXISTS food_orders_ext (
    restaurant_id STRING, 
    payment_type STRING, 
    avg_total_price FLOAT,
    orders_count INT
)
COMMENT "food orders"
ROW FORMAT DELIMITED
FIELDS TERMINATED BY "\t"
STORED AS TEXTFILE
location '${hiveconf:input_dir3}';


CREATE EXTERNAL TABLE IF NOT EXISTS restaurants_ext (
    restaurant_id STRING,
    name STRING,
    city STRING,
    country STRING, 
    cuisine STRING
)
COMMENT "restaurants"
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ","
STORED AS TEXTFILE
location '${hiveconf:input_dir4}';


CREATE VIEW IF NOT EXISTS cuisines as
    SELECT  r.country as country, r.cuisine as cuisine, sum(f.orders_count) as total_orders, avg(f.avg_total_price) as avg_total_price
    FROM    restaurants_ext r inner join food_orders_ext f on r.restaurant_id == f.restaurant_id group by r.country, r.cuisine;

CREATE TABLE cuisines_ranked(
    country STRING,
    cuisine STRING,
    total_orders INT,
    avg_total_price FLOAT,
    rank_in_country INT
)
COMMENT "final stats"
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.JsonSerDe'
STORED AS TEXTFILE
location '${hiveconf:output_dir6}';

INSERT OVERWRITE TABLE cuisines_ranked
    SELECT country, cuisine, total_orders, avg_total_price, rank() over (partition by country order by total_orders desc) as rank_in_country FROM cuisines;

select * from cuisines_ranked;