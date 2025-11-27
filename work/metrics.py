#Zadanie 24,27
import re
import PyPDF2
from io import BytesIO
from pyspark import SparkContext
from pyspark.sql import SparkSession

sc = SparkContext()
spark = SparkSession(sc)


def pdf2txt(file_bytes):
    pdf_file = BytesIO(file_bytes)
    pdf_reader = PyPDF2.PdfReader(pdf_file)
    text = ''
    for page in pdf_reader.pages:
        text += page.extract_text()
    return text, len(pdf_reader.pages)

def extract_filename(hdfs_path):
    return hdfs_path.split('/')[-1]

def count_lines(text):
    return text.count('\n') + 1

def count_sentences(text):
    sentences = re.split(r'[.!?]', text)
    return len(sentences)

def process_file(x):
    filename = extract_filename(x[0])
    text, num_pages = pdf2txt(x[1])
    sentence_count = count_sentences(text)
    line_count = count_lines(text)
    return (filename, (line_count, sentence_count, num_pages))


def parse_csv_line(line):
    parts = line.split(',')
    if len(parts) >= 2:
        filename = parts[0].strip()
        title = parts[1].strip()
        return (filename, title)
    return None


raw_data = sc.binaryFiles('/tmp/cano-pdf/')
file_info = raw_data.map(process_file)
#24
results = file_info.collect()

for filename, metrics in results:
    print(f"{filename} | Linie: {metrics[0]} | Zdania: {metrics[1]} | Strony: {metrics[2]}")
#27
raw_csv = sc.textFile('/tmp/cano-list.csv')

titles_rdd = raw_csv.map(parse_csv_line).filter(lambda x: x is not None)

title_info = file_info.join(titles_rdd)


title_info.toDF().printSchema()

top_3_sentences = title_info.takeOrdered(3, key=lambda x: -x[1][0][1])
print("\n--- TOP 3 Opowiadania (wg liczby zdań) ---")
for item in top_3_sentences:
    filename = item[0]
    metrics = item[1][0]
    sentences = metrics[1]
    title = item[1][1]
    
    print(f"Tytuł: {title} ({filename}) | Liczba zdań: {sentences}")
sc.stop()

