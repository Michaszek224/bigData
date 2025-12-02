#!/usr/bin/env python3
import sys
import csv

reader = csv.reader(sys.stdin)
next(reader, None)

for row in reader:
    if len(row) >= 6 and row[4] and row[5]:
        restaurant_id = row[1]
        payment_type = row[5]
        try:
            total_price = float(row[4])
            composite_key = f"{restaurant_id}|{payment_type}"
            print(f"{composite_key}\t{total_price}\t1")
        except ValueError:
            continue
