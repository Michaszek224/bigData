#!/usr/bin/env python
import sys

RESTAURANT_ID_COL : int = 1
ITEM_COUNT_COL: int = 3
PRICE_COL : int = 4
PAYMENT_TYPE_COL : int = 5
header = "order_id,restaurant_id,order_date,items_count,total_price_usd,payment_type,status"
for line in sys.stdin:
    if header in line:
        continue
    line.strip()
    values = line.split(",")
    restaurant_id = values[RESTAURANT_ID_COL]
    pay_type = values[PAYMENT_TYPE_COL]
    count = values[ITEM_COUNT_COL]
    price = values[PRICE_COL]

    print(f"{restaurant_id},{pay_type}\t{price},{count}")
