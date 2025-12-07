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
exit
source ~/.venv/bin/activate
ls
airflow standalone
source ~/.venv/bin/activate
python --version
export AIRFLOW_HOME=~/airflow
export AIRFLOW_VERSION=3.1.0
export AIRFLOW__CORE__LOAD_EXAMPLES=False
export PYTHON_VERSION="$(python -c 'import sys; \
print(f"{sys.version_info.major}.{sys.version_info.minor}")')"
export CONSTRAINT_URL="https://raw.githubusercontent.com/apache/airflow/\
constraints-${AIRFLOW_VERSION}/constraints-${PYTHON_VERSION}.txt"
export PATH=$PATH:~/.local/bin
curl -LsSf https://astral.sh/uv/install.sh | sh
uv venv
uv pip install "apache-airflow==${AIRFLOW_VERSION}" --constraint "${CONSTRAINT_URL}"
sourcec ~/.venv/bin/activate
source ~/.venv/bin/activate
airflow db migrate
sed -i 's/^refresh_interval\s*=.*/refresh_interval = 15/' ./airflow/airflow.cfg
airflow standalone
exit
head ~/airflow/simple_auth_manager_passwords.json.generated
hdfs dfs -ls /
ls
hdfs dfs -put datasource1 /
hdfs dfs -put datasource4 /
exit
wget http://www.cs.put.poznan.pl/kjankiewicz/bigdata/projekty/test2025-01/zestaw15.zip
ls
unzip zestaw15.zip 
ls
cd input/
ls
cd ..
hadoop dfs -put input /tmp/
ls
hdfs dfs -ls /
hdfs dfs -ls /tmp
hdfs dfs -ls /tmp/input
hdfs dfs -ls /tmp/input/datasource1
hdfs dfs -ls /tmp/input/datasource4
hdfs dfs -cat /tmp/input/datasource4/orders39.csv
hdfs dfs -cat /tmp/input/datasource1/orders39.csv
hdfs dfs -ls /tmp/input/datasource4
hdfs dfs -cat /tmp/input/datasource4/restaurants.csv
ls
unzip dags.zip 
ls
ls
rm datasource1
rm -r datasource1
rm -r datasource4/
ls
rm projekt1.py 
rm reducer.py 
rm mapper.py 
rm run_*
ls
rm hive
rm hive.hql 
rm hive_run.log 
ls
cd dags
ls
cd project_files/
ls
cd ..
ls
c d..
ls
cd project_files/
ls
mv projekt1.py ..
ls
cd ..
ls
cd ..
ls
cd airflow/
ls
cd dags/
ls
cd ..
lss
cd ..
rm -r airflow/
ls
mkdir airflow/
ls
mv dags airflow/
ls
ls
cd airflow/
ls
airflow db migrate
ls
cd ..
ls
cd airflow/
ls
cd dags
ls
cd ..
c d..
cd ..
cd ..
cd ..
cd ..
ls
cd home
ls
cd hadoop/
ls
cd ..
cd ..
ls
cd tmp
ls
cd /hadoop
cd ..
ls
cd ..
cd home/hadoop/
ls
ls
cd airflow/
ls
cd dags/
ls
cd proje
cd ..
cd ..
ls
cd airflow/
ls
ls
cd dags/
ls
ls
hdfs dfs -ls /
hdfs dfs -ls /proc/
hdfs dfs -ls /project1/

hdfs dfs -ls /tmp
hdfs dfs -ls /tmp/hive
hdfs dfs -ls /project1/output_mr3
hdfs dfs -cat /project1/output_mr3/part-00000
hdfs dfs -cat /project1/output_mr3/part-00000 -head 1
hdfs dfs -cat /project1/output_mr3/part-00000 | head -n 1
hdfs dfs -cat /project1/output_mr3/part-00001 | head -n 1
hdfs dfs -cat /project1/output_mr3/part-00002 | head -n 1
exit
wget https://sherlock-holm.es/stories/plain-text/cano.txt
wget https://jankiewicz.pl/bigdata/spark/cano.txt
hadoop fs -mkdir -p .
hadoop fs -copyFromLocal cano.txt .
hadoop fs -ls /
hadoop fs -ls .
pyspark
pyspark --master local[2]
ls
ls
spark-submit --master local sparkWordCount.py file:///home/hadoop/cano.txt b.*b
park-submit --master yarn --driver-memory 3g --executor-memory 3g --executor-cores 1 --num-executors 2 sparkWordCount.py cano.txt c.*c
spark-submit --master yarn --driver-memory 3g --executor-memory 3g --executor-cores 1 --num-executors 2 sparkWordCount.py cano.txt c.*c
exit
wget https://jankiewicz.pl/bigdata/bigdata-sp/cano-pdf.zip
wget https://jankiewicz.pl/bigdata/bigdata-sp/cano-list.csv
unzip cano-pdf.zip
pip show PyPDF2
pip install PyPDF2
pip show PyPDF2
python
hadoop fs -put cano-pdf /tmp/
hadoop fs -put cano-list.csv /tmp/
pyspark --master local[*]
ls
spark-submit --master yarn --driver-memory 3g --executor-memory 3g --executor-cores 1 --num-executors 2 python.py
spark-submit --master yarn --driver-memory 3g --executor-memory 3g --executor-cores 1 --num-executors 2 python.py
spark-submit --master yarn --driver-memory 3g --executor-memory 3g --executor-cores 1 --num-executors 2 python.py
spark-submit --master yarn --driver-memory 3g --executor-memory 3g --executor-cores 1 --num-executors 2 python.py
spark-submit --master yarn --driver-memory 3g --executor-memory 3g --executor-cores 1 --num-executors 2 python.py
spark-submit --master yarn --driver-memory 3g --executor-memory 3g --executor-cores 1 --num-executors 2 python.py
pyspark --master local[*]
pip show PyPDF2
pyspark --master local[*]
exit
ls
pip show PyPDF2
pip install PyPDF2
pip show PyPDF2
python
hadoop fs -put cano-pdf /tmp/
hadoop fs -put cano-list.csv /tmp/
pyspark --master local[*]
ls
spark-submit --master local[*] python.py
hdfs dfs -ls /
hdfs dfs -ls /tmp
hdfs dfs -ls /tmp/cano-pdf
spark-submit --master local[*] python.py
spark-submit --master local[*] python.py
spark-submit --master local[*] python.py
spark-submit --master local[*] python.py
spark-submit --master local[*] watson_count.py
spark-submit --master local[*] watson_count.py
spark-submit --master local[*] watson_count.py
spark-submit --master local[*] word_count.py
spark-submit --master local[*] metrics.py
spark-submit --master local[*] metrics.py
spark-submit --master local[*] title.py
spark-submit --master local[*] metrics.py
spark-submit --master local[*] metrics.py
spark-submit --master local[*] metrics.py
spark-submit --master local[*] metrics.py
exit
ls
spark-submit --master local[*] word_count.py 
pip install PyPDF2
spark-submit --master local[*] word_count.py 
spark-submit --master local[*] word_count.py 
hadoop fs -put cano-list.csv /tmp/
hadoop fs -put cano-pdf /tmp/
spark-submit --master local[*] word_count.py 
ls
spark-submit --master local[*] watson_count.py 
ls
spark-submit --master local[*] metrics.py 
exit
ls
ls
pip install PyPDF2
hadoop fs -put cano-list.csv /tmp/
hadoop fs -put cano-pdf /tmp/
spark-submit --master local[*] word_count.py 
ls
spark-submit --master local[*] watson_count.py 
ls
spark-submit --master local[*] metrics.py 
exit
head ign.csv
ls
ls
rm ign.csv
wget https://jankiewicz.pl/bigdata/bigdata-sp/ign.csv
wget https://jankiewicz.pl/bigdata/bigdata-sp/mondial.countries.json
wget https://jankiewicz.pl/bigdata/bigdata-sp/mondial.cities.json
ls
hadoop fs -mkdir -p .
hadoop fs -l /
hadoop fs -ls /
hadoop fs -ls /user
hadoop fs -ls /tmp
hadoop fs -mkdir -p .
hadoop fs -ls
hadoop fs -copyFromLocal ign.csv .
hadoop fs -copyFromLocal mondial.countries.json .
hadoop fs -copyFromLocal mondial.cities.json .
hadoop fs -ls
hadoop fs -ls /user
hadoop fs -ls /user/hadoop
exit
exit
wget https://jankiewicz.pl/bigdata/bigdata-ss/DeltaLake/DeltaLake1.csv
wget https://jankiewicz.pl/bigdata/bigdata-ss/DeltaLake/DeltaLake2.csv
wget https://jankiewicz.pl/bigdata/bigdata-ss/DeltaLake/DeltaLake3.csv
hadoop fs -mkdir -p /tmp/DeltaLakeSourceData
hadoop fs -copyFromLocal *.csv /tmp/DeltaLakeSourceData
pyspark --version
ls
hdfs dfs -ls /
hdfs dfs -ls /tmp
hdfs dfs -ls /tmp/delta-table2
hdfs dfs -ls /tmp/DeltaLakeSourceData
hdfs dfs -cat /tmp/DeltaLakeSourceData/DeltaLake1.csv
hdfs dfs -ls /tmp/DeltaLakeSourceData
hdfs dfs -rm /tmp/DeltaLakeSourceData/ign.csv
hdfs dfs -rm /tmp/DeltaLakeSourceData/cano-list.csv
exit
