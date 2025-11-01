#!/usr/bin/env python3
import sys

current_key = None
total_sum = 0
total_count = 0

for line in sys.stdin:
    restaurant_id, payment_type, partial_sum, partial_count = line.strip().split("\t")
    key = f"{restaurant_id}\t{payment_type}"
    partial_sum = float(partial_sum)
    partial_count = int(partial_count)

    if current_key == key:
        total_sum += partial_sum
        total_count += partial_count
    else:
        if current_key:
            avg = total_sum / total_count
            print(f"{current_key}\t{total_count}\t{avg:.2f}")
        current_key = key
        total_sum = partial_sum
        total_count = partial_count

if current_key:
    avg = total_sum / total_count
    print(f"{current_key}\t{total_count}\t{avg:.2f}")

