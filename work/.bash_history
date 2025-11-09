cat /home/hadoop/data/datasource1/orders00.csv | python3 /home/hadoop/mapper.py | sort | python3 /home/hadoop/reducer.py | head
ls
cat reducer.py 
cat /home/hadoop/data/datasource1/orders00.csv | python3 /home/hadoop/mapper.py | sort | python3 /home/hadoop/reducer.py > /tmp/test_output.txt
head /tmp/test_output.txt
hdfs dfs -rm -r -f /output/datasource3
hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming*.jar   -input /input/datasource1   -output /output/datasource3   -mapper /home/hadoop/mapper.py   -reducer /home/hadoop/reducer.py   -files /home/hadoop/mapper.py,/home/hadoop/reducer.py
cd /home/hadoop/
ls
chmod +x mapper.py reducer.py 
hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming*.jar   -input /input/datasource1   -output /output/datasource3   -mapper /home/hadoop/mapper.py   -reducer /home/hadoop/reducer.py   -files /home/hadoop/mapper.py,/home/hadoop/reducer.py
hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming*.jar   -input /input/datasource1   -output /output/datasource3   -mapper /home/hadoop/mapper.py   -reducer /home/hadoop/reducer.py   -files /home/hadoop/mapper.py,/home/hadoop/reducer.py
hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming*.jar   -input /input/datasource1   -output /output/datasource3   -mapper /home/hadoop/mapper.py   -reducer /home/hadoop/reducer.py   -file /home/hadoop/mapper.py   -file /home/hadoop/reducer.py
hdfs dfs -cat /output/datasource3/part-00000 | head
hdfs dfs -cat /output/datasource3/part-* | wc -l
chmod +x run_mr.sh 
ls
./run_mr.sh
./run_mr.sh datasource1 datasource3
./run_mr.sh
chmod +x run_mr.sh 
./run_mr.sh datasource1 datasource3
chmod +x run_mr.sh 
./run_mr.sh datasource1 datasource3
chmod +x run_mr.sh 
./run_mr.sh datasource1 datasource3
chmod +x run_mr.sh 
./run_mr.sh datasource1 datasource3
hdfs dfs -cat /output/datasource3/part-00000 | head
hdfs dfs -cat /output/datasource3/part-* | wc -l
chmod +x run_mr.sh 
./run_mr.sh datasource1 datasource3
chmod +x reducer.py combiner.py mapper.py 
chmod +x run_mr.sh 
./run_mr.sh datasource1 datasource3
chmod +x reducer.py combiner.py mapper.py 
./run_mr.sh datasource1 datasource3
./run_mr.sh datasource1 datasource3
hdfs dfs -cat /input/datasource1/order0.csv | head -5
hdfs dfs -cat /input/datasource1/order00.csv | head -5
hdfs dfs -cat /input/ | head -5
hdfs dfs -ls /input/ | head -5
hdfs dfs -ls /input/datasource1 | head -5
hdfs dfs -head /input/datasource1/orders00.csv | head -5
chmod +x mapper.py reducer.py combiner.py 
ls
./run_mr.sh datasource1 datasource3
chmod +x run_mr.sh 
./run_mr.sh datasource1 datasource3
chmod +x run_mr.sh 
./run_mr.sh datasource1 datasource3
hdfs dfs -cat /output/datasource3/part-00000 | head
hdfs dfs -cat /output/datasource3/part-00000 | head
hdfs dfs -cat /output/datasource3/part-00000
./run_mr.sh datasource1 datasource3
./run_mr.sh datasource1 datasource3
hdfs dfs -cat /input/datasource3/part-00000 | head -20 | python3 mapper.py
hdfs dfs -cat /output/datasource3/part-00000 | head -20 | python3 mapper.py
chmod +x reducer.py mapper.py combiner.py 
./run_mr.sh datasource1 datasource3
chmod +x reducer.py 
./run_mr.sh datasource1 datasource3
chmod +x mapper.py
chmod +x combiner.py
chmod +x reducer.py
./run_mr.sh datasource1 datasource3
hdfs dfs -cat /output/datasource3/part-00000 | head
chmod +x run_mr.sh 
./run_mr.sh datasource1 datasource3
hdfs dfs -cat /output/datasource3/part-00000 | head
chmod +x mapper.py combiner.py reducer.py 
./run_mr.sh datasource1 datasource3
hdfs dfs -cat /output/datasource3/part-00000 | head
chmod +x mapper.py combiner.py reducer.py 
./run_mr.sh datasource1 datasource3
hdfs dfs -cat /output/datasource3/part-00000 | head
hdfs dfs -cat /output/datasource3/part-00000
./run_mr.sh datasource1 datasource3
hdfs dfs -cat /output/datasource3/part-00000
exit
hdfs dfs -cat /output/datasource3/part-00000
exit
hdfs dfs -ls /
hdfs dfs -ls /input
exit
hdfs dfs -ls /
hdfs dfs -ls /input
hdfs dfs -mv /input/datasource1 /
hdfs dfs -ls /
hdfs dfs -ls /input
hdfs dfs -rm -r  /input
hdfs dfs -ls  /
hdfs dfs -ls  /datasource1
hdfs dfs -ls  /
hdfs dfs -ls  /output
hdfs dfs -mv  /output/datasource3 .
hdfs dfs -ls  /
hdfs dfs -ls  /output
hdfs dfs -ls  /user
hdfs dfs -ls  /user/hadoop
hdfs dfs -mv  /user/hadoop/datasource3 /
hdfs dfs -ls /
hdfs dfs -ls /datasource1
hdfs dfs -ls /datasource2
hdfs dfs -ls /datasource3
./run_mr.sh datasource1 datasource3
hdfs dns -ls /
hdfs dfs -ls /datasource2
hdfs dfs -ls /
hdfs dfs -ls /datasource3
ls
ls data
unzip zestaw15.zip 
ls
cd input/
ls
mv datasource ..
ls
mv datasource ..
ls
mv datasource4 ..
ls
cd ..
ls
rm -r data
rm zestaw15.zip 
ls
cd datasource4/
ls
nvim restaurants.csv 
vi restaurants.csv 
catr restaurants.csv 
cat restaurants.csv 
:q!
cd ..
ls
rm -r input/
ls
hdfs dfs -mv datasource4/ /
hdfs dfs -mv .datasource4/ /
hdfs dfs -mv ./datasource4/ /
hadoop fs -put datasource4/ /
hdfs dfs -ls /
hdfs dfs -ls /datasource4
hdfs dfs -ls /datasource3
hdfs dfs -ls /datasource1
hdfs dfs -ls /datasource4
hdfs dfs -ls /
hdfs dfs -ls /output
hdfs dfs -rm -r /output
hdfs dfs -ls /
exit
hdfs dfs -ls /
hdfs dfs -ls /datasource3
hdfs dfs -ls /datasource4
exit
hdfs dfs -ls /datasource3
hdfs dfs -cat /datasource3/part-00000
hdfs dfs -cat /datasource4/
hdfs dfs -ls /datasource4/
hdfs dfs -cat /datasource4/restourants.csv
hdfs dfs -cat /datasource4/restaurants.csv
hdfs dfs -cat /datasource4/restaurants.csv | head
hdfs dfs -ls /datasource3
hdfs dfs -ls -la /datasource3
hdfs dfs -lsa /datasource3
hdfs dfs -ls /datasource3
hdfs dfs -cat /datasource3/part-00000
exit
ls
chmod +x hive.hql 
chmod +x run_hive.sh 
hdfs dfs -ls /
./run_hive.sh datasource3 datasource4 datasource6
hdfs dfs -ls /
./run_hive.sh 
tree
ls
cd ..
ls
cd hadoop/
chmod +x run_hive.sh 
./run_hive.sh datasource3 datasource4 datasource6
./run_hive.sh /datasource3 /datasource4 /datasource6
hdfs fds -ls /
hdfs dfs -ls /
./run_hive.sh datasource3 datasource4 datasource6
./run_mr.sh datasource1 datasource3
hdfs dfs -ls /
hdfs dfs -ls /datasource1
hdfs dfs -ls /datasource3
hdfs dfs -ls /datasource4
chmod +x run_hive.sh 
./run_hive.sh datasource3 datasource4 datasource6
hdfs dfs -ls /
hdfs dfs -lsa /
hdfs dfs -chmod 777 /
./run_hive.sh datasource3 datasource4 datasource6
jps
jps | grep HiveServer2
sudo systemctl status hive-server2
  sudo service hive-server2 status
beeline -u "jdbc:hive2://localhost:10000/default" -e "SHOW DATABASES;"
chmod +x run_hive.sh 
./run_hive.sh datasource3 datasource4 datasource6
chmod +x run_hive.sh 
./run_hive.sh datasource3 datasource4 datasource6
hdfs fds -ls /
hdfs dfs -ls /
hdfs dfs -ls /datasource6
./run_hive.sh datasource3 datasource4 datasource6
beeline -u "jdbc:hive2://localhost:10000/default"   -n hadoop   --hiveconf input_dir3="/datasource3"   --hiveconf input_dir4="/datasource4"   -f /home/hadoop/hive_debug.hql
rm hive.hql 
./run_hive.sh datasource3 datasource4 datasource6
ls
hdfs fds -ls /
hdfs dfs -ls /
hdfs dfs -ls /datasource6
hdfs dfs -rm -r  /datasource6
./run_hive.sh datasource3 datasource4 datasource6
hdfs dfs -ls /datasource6
hdfs dfs -ls /datasource6
hdfs dfs -ls /
# 1. Sprawdź czy skrypt się w ogóle wykonuje
./run_hive.sh datasource3 datasource4 datasource6 2>&1 | tee hive_run.log
# 2. Jeśli skrypt się wykonał, sprawdź logi
tail -50 hive_run.log
# 3. Sprawdź czy folder datasource6 istnieje (może być pusty)
hdfs dfs -ls / | grep datasource
# 4. Sprawdź czy tabela restaurants została utworzona
beeline -u "jdbc:hive2://localhost:10000/default" -n hadoop -e "
SHOW TABLES;
SELECT COUNT(*) FROM restaurants;
SELECT * FROM restaurants LIMIT 5;
"
# 1. Usuń wszystkie tabele i wyczyść metadane
beeline -u "jdbc:hive2://localhost:10000/default" -n hadoop -e "
DROP TABLE IF EXISTS restaurants;
DROP TABLE IF EXISTS restaurants_raw;
DROP TABLE IF EXISTS datasource3;
"
# 2. Upewnij się że używasz nowego skryptu hive.hql
cat /home/hadoop/hive.hql | grep -A5 "restaurants_raw"
# 3. Jeśli nie widzisz restaurants_raw, skopiuj nową wersję
cat /home/hadoop/hive.hql | grep -A5 "restaurants_raw"
./run_hive.sh datasource3 datasource4 datasource6
cat > /home/hadoop/hive.hql << 'EOF'
-- hive.hql
-- Skrypt Hive łączący dane o zamówieniach z restauracjami
-- Parametry: input_dir3, input_dir4, output_dir6
USE default;

-- Usuń poprzednie definicje
DROP TABLE IF EXISTS datasource3;
DROP TABLE IF EXISTS restaurants;
DROP TABLE IF EXISTS restaurants_raw;

-- 1) Dane z MapReduce (input_dir3)
-- Format: restaurant_id, payment_type, total_orders, avg_total_price
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

-- 2) Dane surowe z CSV (bez parsowania nagłówka przez SerDe)
CREATE EXTERNAL TABLE restaurants_raw (
  line STRING
)
STORED AS TEXTFILE
LOCATION '${hiveconf:input_dir4}';

-- 3) Parsowanie CSV ręcznie i pomijanie nagłówka
CREATE TABLE restaurants AS
SELECT
  split(line, ',')[0] AS restaurant_id,
  regexp_replace(split(line, ',')[1], '"', '') AS name,
  regexp_replace(split(line, ',')[2], '"', '') AS city,
  regexp_replace(split(line, ',')[3], '"', '') AS country,
  regexp_replace(split(line, ',')[4], '"', '') AS cuisine
FROM restaurants_raw
WHERE line NOT LIKE 'restaurant_id,%'  -- Pomiń nagłówek
  AND length(trim(line)) > 0;          -- Pomiń puste linie

-- 4) Wynik: agregacja po kraju i rodzaju kuchni
INSERT OVERWRITE DIRECTORY '${hiveconf:output_dir6}'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
SELECT
  concat(
    '{"country":"',   nvl(country,''), '",',
    '"cuisine":"',    nvl(cuisine,''), '",',
    '"total_orders":', cast(total_orders as string), ',',
    '"avg_total_price":', cast(avg_total_price as string), ',',
    '"rank_in_country":', cast(rank_in_country as string),
    '}'
  ) AS json_record
FROM (
  WITH joined AS (
    SELECT
      r.country,
      r.cuisine,
      s.total_orders,
      s.avg_total_price
    FROM datasource3 s
    JOIN restaurants r
      ON s.restaurant_id = r.restaurant_id
  ),
  agg AS (
    SELECT
      country,
      cuisine,
      SUM(total_orders) AS total_orders,
      ROUND(SUM(total_orders * avg_total_price) / SUM(total_orders), 2) AS avg_total_price
    FROM joined
    GROUP BY country, cuisine
  ),
  ranked AS (
    SELECT
      country,
      cuisine,
      total_orders,
      avg_total_price,
      ROW_NUMBER() OVER (PARTITION BY country ORDER BY total_orders DESC) AS rank_in_country
    FROM agg
  )
  SELECT country, cuisine, total_orders, avg_total_price, rank_in_country
  FROM ranked
) t
ORDER BY country, rank_in_country;
EOF

cat > /home/hadoop/hive.hql << 'EOF'
-- hive.hql
-- Skrypt Hive łączący dane o zamówieniach z restauracjami
-- Parametry: input_dir3, input_dir4, output_dir6
USE default;

-- Usuń poprzednie definicje
DROP TABLE IF EXISTS datasource3;
DROP TABLE IF EXISTS restaurants;
DROP TABLE IF EXISTS restaurants_raw;

-- 1) Dane z MapReduce (input_dir3)
-- Format: restaurant_id, payment_type, total_orders, avg_total_price
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

-- 2) Dane surowe z CSV (bez parsowania nagłówka przez SerDe)
CREATE EXTERNAL TABLE restaurants_raw (
  line STRING
)
STORED AS TEXTFILE
LOCATION '${hiveconf:input_dir4}';

-- 3) Parsowanie CSV ręcznie i pomijanie nagłówka
CREATE TABLE restaurants AS
SELECT
  split(line, ',')[0] AS restaurant_id,
  regexp_replace(split(line, ',')[1], '"', '') AS name,
  regexp_replace(split(line, ',')[2], '"', '') AS city,
  regexp_replace(split(line, ',')[3], '"', '') AS country,
  regexp_replace(split(line, ',')[4], '"', '') AS cuisine
FROM restaurants_raw
WHERE line NOT LIKE 'restaurant_id,%'  -- Pomiń nagłówek
  AND length(trim(line)) > 0;          -- Pomiń puste linie

-- 4) Wynik: agregacja po kraju i rodzaju kuchni
INSERT OVERWRITE DIRECTORY '${hiveconf:output_dir6}'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
SELECT
  concat(
    '{"country":"',   nvl(country,''), '",',
    '"cuisine":"',    nvl(cuisine,''), '",',
    '"total_orders":', cast(total_orders as string), ',',
    '"avg_total_price":', cast(avg_total_price as string), ',',
    '"rank_in_country":', cast(rank_in_country as string),
    '}'
  ) AS json_record
FROM (
  WITH joined AS (
    SELECT
      r.country,
      r.cuisine,
      s.total_orders,
      s.avg_total_price
    FROM datasource3 s
    JOIN restaurants r
      ON s.restaurant_id = r.restaurant_id
  ),
  agg AS (
    SELECT
      country,
      cuisine,
      SUM(total_orders) AS total_orders,
      ROUND(SUM(total_orders * avg_total_price) / SUM(total_orders), 2) AS avg_total_price
    FROM joined
    GROUP BY country, cuisine
  ),
  ranked AS (
    SELECT
      country,
      cuisine,
      total_orders,
      avg_total_price,
      ROW_NUMBER() OVER (PARTITION BY country ORDER BY total_orders DESC) AS rank_in_country
    FROM agg
  )
  SELECT country, cuisine, total_orders, avg_total_price, rank_in_country
  FROM ranked
) t
ORDER BY country, rank_in_country;
EOF

./run_hive.sh datasource3 datasource4 datasource6
hdfs dfs -ls /
beeline -u "jdbc:hive2://localhost:10000/default" -n hadoop -e "
DROP TABLE IF EXISTS restaurants;
DROP TABLE IF EXISTS restaurants_raw;
DROP TABLE IF EXISTS datasource3;
DROP TABLE IF EXISTS datasource4;
"
chmod +x /home/hadoop/run_hive.sh
./run_hive.sh datasource3 datasource4 datasource6
hdfs fds -ls /
hdfs fds -ls \
hdfs dfs -ls /
hdfs dfs -ls /datasource6
hdfs dfs -cat /datasource6/000000_0
./run_hive.sh datasource3 datasource4 datasource6
hdfs dfs -cat /datasource6/000000_0
exit
ls
hdfs dfs -ls /
ls
chmod +x run_hive.sh 
chmod +x run_mr.sh 
./run_mr.sh 
ls
cd datasource4/
ls
cd ..
wget https://www.cs.put.poznan.pl/kjankiewicz/bigdata/projekty/zestaw15.zip
ls
unzip zestaw15.zip 
ls
rm datasource4/
rm -r datasource4/
ls
mv input/ datasource
ls
cd datasource/
ls
mv datasource* ..
ls
cd ..
ls
rm datasource
rm -r datasource
ls
cd datasource1
ls
cd ..
ls
ls
rm zestaw15.zip 
hadoop fs -put datasource1 /
hadoop fs -put datasource4 /
hdfs dfs -ls /
hdfs dfs -ls /datasource1
hdfs dfs -ls /datasource4
clear
ls
vi run_mr.sh 
vim run_mr.sh 
nano run_mr.sh 
./run_mr.sh datasource1 datasource3
./run_hive.sh.sh datasource3 datasource4 datasource6
./run_hive.sh datasource3 datasource4 datasource6
hdfs dfs -ls /
hdfs dfs -ls /datasource3
hdfs dfs -cat /datasource3/part-00000
hdfs dfs -ls /datasource6
hdfs dfs -cat /datasource6/000000_0
clear
exit
