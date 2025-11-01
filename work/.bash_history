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
