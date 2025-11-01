#!/bin/bash
set -euo pipefail

INPUT_DIR=$1
OUTPUT_DIR=$2

hdfs dfs -rm -r -f /output/$OUTPUT_DIR

hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming*.jar \
  -input /input/"$INPUT_DIR" \
  -output /output/"$OUTPUT_DIR" \
  -mapper /home/hadoop/mapper.py \
  -combiner /home/hadoop/combiner.py \
  -reducer /home/hadoop/reducer.py \
  -file /home/hadoop/mapper.py \
  -file /home/hadoop/reducer.py \
  -file /home/hadoop/combiner.py
