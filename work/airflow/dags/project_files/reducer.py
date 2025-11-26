#!/usr/bin/env python
import sys

RESTAURANT_ID_COL : int = 0
PAYMENT_TYPE_COL : int = 1
PRICE_COL : int = 2
ORDERS_COUNT: int = 3
ITEM_COUNT_COL: int = 4



current_restaurant = None
current_paytype = None
current_total_price = 0
current_orders_count = 0
current_item_count = 0


for line in sys.stdin:
    restaurant_paytype, price_orders_item_count = line.split("\t")

    restaurant, paytype = restaurant_paytype.split(",")
    price, orders, item_count = price_orders_item_count.split(",")

    if restaurant == current_restaurant and paytype == current_paytype:
        current_total_price += float(price)
        current_item_count += int(item_count)
        current_orders_count += int(orders)
    else:
        if current_restaurant and current_paytype:
            print(f"{current_restaurant}\t{current_paytype}\t{current_total_price/ current_orders_count : .2f}\t{current_item_count}")
        
        current_restaurant = restaurant
        current_paytype = paytype
        
        current_orders_count = int(orders)
        current_item_count = int(item_count)
        current_total_price = float(price)
