#!/bin/bash
set -euo pipefail

if [ $# -ne 3 ]; then
    echo "Użycie: $0 input_dir3 input_dir4 output_dir6"
    exit 1
fi

INPUT_DIR3=$1
INPUT_DIR4=$2
OUTPUT_DIR6=$3

if ! hdfs dfs -test -d "/$INPUT_DIR3"; then
    echo "BŁĄD: Katalog /$INPUT_DIR3 nie istnieje!"
    exit 1
fi

if ! hdfs dfs -test -d "/$INPUT_DIR4"; then
    echo "BŁĄD: Katalog /$INPUT_DIR4 nie istnieje!"
    exit 1
fi

hdfs dfs -rm -r -f "/$OUTPUT_DIR6" 2>/dev/null || true

beeline \
  -u "jdbc:hive2://localhost:10000/default" \
  -n hadoop \
  --hiveconf input_dir3="/$INPUT_DIR3" \
  --hiveconf input_dir4="/$INPUT_DIR4" \
  --hiveconf output_dir6="/$OUTPUT_DIR6" \
  -f /home/hadoop/hive.hql

EXIT_CODE=$?

