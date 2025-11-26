import re
import PyPDF2
from io import BytesIO
from pyspark import SparkContext, SparkConf

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

def process_pdf_record(record):
    path, content = record
    
    filename = extract_filename(path)
    
    text, _ = pdf2txt(content)
    
    words = re.findall(r'\b\w+\b', text, flags=re.UNICODE)
    word_count = len(words)
    
    return (filename, word_count)

raw_data = sc.binaryFiles('/tmp/cano-pdf')
word_counts_rdd = raw_data.map(process_pdf_record)

results = word_counts_rdd.collect()

for filename, count in results:
    print(f"{filename} | {count}")
