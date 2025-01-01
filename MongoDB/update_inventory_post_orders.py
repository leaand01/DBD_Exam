from CreateDB import db


orders_collection = db["orders"]
inventory_collection = db["inventory"]

# Hent alle ordrer
orders = orders_collection.find()

# loop over hver enkelt ordrer
for order in orders:
    items = order["items"]  # alle items i den enkelte ordrer
    order_timestamp = order["timestamp"]

    # loop over alle items i ordren
    for item in items:
        item_id = item["item_id"]
        amount_sold = item["amount"]
        price = item["price"]
        category = item["category"]

        # Find den seneste lagerstatus for item
        latest_inventory = inventory_collection.find_one(
            {"item_id": item_id}, sort=[("timestamp", -1)]
        )

        # Beregn ny lagerstatus
        new_quantity = latest_inventory["quantity"] - amount_sold  # Should include tests that inventory cannot be negative. Not implemented

        # Opret en ny log for lageropdateringen
        inventory_collection.insert_one({
            "item_id": item_id,
            "timestamp": order_timestamp,
            "item": item["item"],
            "quantity": new_quantity,
            "price": price,
            "category": category,

            # Kunne tilføje
            "change": -amount_sold,  # Ændring i lagerstatus
            "order_id": order["order_id"],  # Reference til ordren for hurtigt overblik
        })
