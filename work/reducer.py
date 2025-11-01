#!/usr/bin/env python3
import sys

current_key = None
count_sum = 0
total_sum = 0.0

for line in sys.stdin:
    parts = line.strip().split("\t")
    if len(parts) != 3:
        continue
        
    composite_key, total, count = parts
    count = int(count)
    total = float(total)
    
    if current_key == composite_key:
        count_sum += count
        total_sum += total
    else:
        if current_key:
            restaurant_id, payment_type = current_key.split("|", 1)
            avg = total_sum / count_sum if count_sum > 0 else 0
            print(f"{restaurant_id}\t{payment_type}\t{count_sum}\t{avg:.2f}")
        current_key = composite_key
        count_sum = count
        total_sum = total

if current_key:
    restaurant_id, payment_type = current_key.split("|", 1)
    avg = total_sum / count_sum if count_sum > 0 else 0
    print(f"{restaurant_id}\t{payment_type}\t{count_sum}\t{avg:.2f}")
