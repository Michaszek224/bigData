ls
ls
cd notebooks/
ls
nvim pyspark.ipynb 
vim pyspark.ipynb 
vi pyspark.ipynb 
cd ~
ls
wget https://www.cs.put.poznan.pl/kjankiewicz/bigdata/projekty/zestaw15.zip
ls
unzip zestaw15.zip 
rm zestaw15.zip 
ls
cd input/
ls
exit
hdfs getconf -confKey mapreduce.framework.name
hdfs getconf -confKey mapreduce.job.reduces
ls
hadoop fs -mkdir -p input
ls
cd input/
ls
ls
cd datasource
cd datasource1
ls
cd ..
cd ..
ls
hadoop fs -ls -R input/
rm -r input/
hadoop fs -mkdir -p input
ls
cd notebooks/
ls
cd ..
ls
cd ..
ls
cd ..
ls
cd home/
ls
cd hadoop/
ls
cd ..
ls
ls
cd ..
ls
cd ~
ls
clear
hadoop fs -mkdir -p input
ls
wget 
wget https://www.cs.put.poznan.pl/kjankiewicz/bigdata/projekty/zestaw15.zip
ls
unzip --help
unzip zestaw15.zip 
ls
rm zestaw15.zip 
ls
hadoop fs -put input input/
hadoop fs -put *.csv input/
ls
hadoop fs -ls -R input/
exit
ls
wget https://www.cs.put.poznan.pl/kjankiewicz/bigdata/projekty/zestaw15.zip
ls
ls
ls
ls
unzip zestaw15.zip 
ls
ls
mv input/ data
ls
cd data/
ls
rm -r datasource4
ls
cd datasource1/
ls
cd ..
ls
ls
hadoop fs -mkdir -p input
hadoop fs -put datasource1/ input/
hadoop fs -put *.csv input
ls
hadoop fs -l -r input/
hadoop fs -ls -r input/
hadoop fs -ls -R input/
hadoop fs -ls -R input/ | wl-copy
hadoop fs -rm -r /input
hadoop fs -rm -r
hdfs dfs -rm -r /input/*
hdfs dfs -rm -r input/
hadoop fs -ls -R input/
hadoop fs -mkdir -p input
hadoop fs -put trips input/

hadoop fs -put datasource1/ input/
hadoop fs -put *.csv input/
hadoop fs -ls -R input/
hdfs fsck input/datasource1/orders99.csv -files -blocks -locations
exit
ls
chmod +x mapper.py reducer.py 
python --version
ls
cat data/datasource1/orders00.csv | python mapper.py | sort -k,1 | python reducer.py 
chmod +x mapper.py reducer.py 
ls -la
ls -la | grep .py
cat data/datasource1/orders00.csv |./mapper.py | sort | ./reducer.py 
cat data/datasource1/orders00.csv | python mapper.py | sort | python reducer.py 
hadoop fs -ls -R input/
hdfs dfs -ls /input/datasource1
hdfs dfs -ls input/datasource1
hdfs dfs -ls input/datasource1ls /home/hadoop/work
ls /home/hadoop/workh
ls /home/hadoop/work
ls home/hadoop/work
ls
cd ..
ls
cd hadoop/
cd ~
ls ~
ls /
ls /home
ls /home/hadoop/
hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming*.jar   -input /input/datasource1   -output /output/datasource3   -mapper /home/hadoop/mapper.py   -reducer /home/hadoop/reducer.py   -file /home/hadoop/mapper.py   -file /home/hadoop/reducer.py
hdfs dfs -ls /input
hdfs dfs -ls input
hdfs dfs -mv input /input
hdfs dfs -ls /input
hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming*.jar   -input /input/datasource1   -output /output/datasource3   -mapper /home/hadoop/mapper.py   -reducer /home/hadoop/reducer.py   -files /home/hadoop/mapper.py,/home/hadoop/reducer.py
hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming*.jar   -input /input/datasource1   -output /output/datasource3   -mapper /home/hadoop/mapper.py   -reducer /home/hadoop/reducer.py   -files /home/hadoop/mapper.py,/home/hadoop/reducer.py
hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming*.jar   -input /input/datasource1   -output /output/datasource3   -mapper /home/hadoop/mapper.py   -reducer /home/hadoop/reducer.py   -file /home/hadoop/mapper.py   -file /home/hadoop/reducer.py
yarn logs -applicationId job_1762035315596_0002
yarn logs -applicationId job_1762035315596_0002
yarn logs -applicationId job_1762035315596_0002
yarn logs -applicationId job_1762035315596_0002
yarn logs -applicationId application_1762035315596_0002
cat /home/hadoop/data/datasource1/orders00.csv | python3 /home/hadoop/mapper.py | sort | python3 /home/hadoop/reducer.py | head
chmod +x /home/hadoop/mapper.py /home/hadoop/reducer.py
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
