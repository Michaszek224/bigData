#!/usr/bin/env python3
import sys

current_key = None
total_sum = 0
total_count = 0

for line in sys.stdin:
    restaurant_id, payment_type, total_price = line.strip().split("\t")
    key = f"{restaurant_id}\t{payment_type}"
    total_price = float(total_price)

    if current_key == key:
        total_sum += total_price
        total_count += 1
    else:
        if current_key:
            print(f"{current_key}\t{total_sum}\t{total_count}")
        current_key = key
        total_sum = total_price
        total_count = 1

if current_key:
    print(f"{current_key}\t{total_sum}\t{total_count}")
