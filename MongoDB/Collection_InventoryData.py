import uuid
from datetime import datetime
from CreateDB import db


# Opret en collection for inventory
inventory_collection = db["inventory"]

# Indsæt nogle dokumenter
inventory_data = [
    {"item_id": str(uuid.uuid4()), "timestamp": datetime.utcnow(), "item": "item1", "quantity": 100, "price": 100, "category": "category1"},
    {"item_id": str(uuid.uuid4()), "timestamp": datetime.utcnow(), "item": "item2", "quantity": 90, "price": 110, "category": "category1"},
    {"item_id": str(uuid.uuid4()), "timestamp": datetime.utcnow(), "item": "item3", "quantity": 40, "price": 180, "category": "category2"},
    {"item_id": str(uuid.uuid4()), "timestamp": datetime.utcnow(), "item": "item4", "quantity": 30, "price": 190, "category": "category2"},
]

inventory_collection.insert_many(inventory_data)
