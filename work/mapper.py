#!/usr/bin/env python3
import sys
import csv

reader = csv.reader(sys.stdin)
next(reader, None)  # skip header
for row in reader:
    restaurant_id = row[1]
    payment_type = row[5]
    total_price = float(row[4])
    print(f"{restaurant_id}\t{payment_type}\t{total_price}")
