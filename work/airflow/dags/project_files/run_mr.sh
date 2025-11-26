#!/bin/bash
hadoop fs -rm -r $2

mapred streaming -files mapper.py,combiner.py,reducer.py \
-input $1 -output $2 -mapper "python mapper.py" \
-combiner "python combiner.py" -reducer "python reducer.py"