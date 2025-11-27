#zadanie 23

import re
import PyPDF2
from io import BytesIO
from pyspark import SparkContext

sc = SparkContext()

def pdf2txt(file_bytes):
    pdf_file = BytesIO(file_bytes)
    pdf_reader = PyPDF2.PdfReader(pdf_file)
    text = ''
    for page in pdf_reader.pages:
        text += page.extract_text()
    return text, len(pdf_reader.pages)

def extract_filename(hdfs_path):
    return hdfs_path.split('/')[-1]

def count_word(text, word):
    return re.findall(r'\b\w+\b', text.lower(), flags=re.UNICODE).count(word.lower())

def process_pdf_record(record):
    path, content = record
    
    filename = extract_filename(path)
    text, _ = pdf2txt(content)
    
    count = count_word(text, "Watson")
    
    return (filename, count)

raw_data = sc.binaryFiles('/tmp/cano-pdf/')

watson_counts = raw_data.map(process_pdf_record)

filtered_counts = watson_counts.filter(lambda x: x[1] > 0)

sorted_counts = filtered_counts.sortBy(lambda x: x[1], ascending=False)

results = sorted_counts.collect()

for filename, count in results:
    print(f"{filename} | {count}")

#Uruchamianie
#spark-submit --master local[*] python.py
