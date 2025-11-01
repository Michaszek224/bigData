#!/usr/bin/env python3
import sys

current_key = None
total_sum = 0.0
total_count = 0

for line in sys.stdin:
    parts = line.strip().split("\t")
    if len(parts) != 3:
        continue
    
    composite_key, total_price, count = parts
    total_price = float(total_price)
    count = int(count)
    
    if current_key == composite_key:
        total_sum += total_price
        total_count += count
    else:
        if current_key:
            print(f"{current_key}\t{total_sum}\t{total_count}")
        current_key = composite_key
        total_sum = total_price
        total_count = count

if current_key:
    print(f"{current_key}\t{total_sum}\t{total_count}")
