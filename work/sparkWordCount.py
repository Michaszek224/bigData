import re
import sys
from pyspark import SparkContext, SparkConf

def main(input_path, pattern):
    conf = SparkConf().setAppName("sparkWordCount")
    sc = SparkContext(conf=conf)
    try:
        cano = sc.textFile(input_path)
        canoTokenized = cano.flatMap(lambda line: re.split(r'\W+', line))
        canoWordGroups = canoTokenized.groupBy(lambda word: word)
        canoWordCounts = canoWordGroups.map(lambda pair: (pair[0], len(pair[1])))
        lambda word: bool(re.match(pattern, word))
        topWordList = canoWordCounts.sortBy(lambda pair: pair[1], False).take(10)
        for wordPair in topWordList:
            print(wordPair)
    finally:
        sc.stop()
if __name__ == "__main__":
    if len(sys.argv) != 3:
        print(f"Użycie: {sys.argv[0]} <ścieżka_do_pliku> <wzorzec>")
        sys.exit(1)
    main(sys.argv[1], sys.argv[2])