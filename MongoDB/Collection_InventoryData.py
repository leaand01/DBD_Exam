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
# inventory_data = [
#     {"item_id": str(uuid.uuid4()), "timestamp": datetime.utcnow(), "item": "item1", "quantity": 100, "price": 100, "category": "category1"},
#     {"item_id": str(uuid.uuid4()), "timestamp": datetime.utcnow(), "item": "item2", "quantity": 90, "price": 110, "category": "category1"},
#     {"item_id": str(uuid.uuid4()), "timestamp": datetime.utcnow(), "item": "item3", "quantity": 80, "price": 120, "category": "category1"},
#     {"item_id": str(uuid.uuid4()), "timestamp": datetime.utcnow(), "item": "item4", "quantity": 70, "price": 130, "category": "category2"},
#     {"item_id": str(uuid.uuid4()), "timestamp": datetime.utcnow(), "item": "item5", "quantity": 70, "price": 140, "category": "category2"},
#     {"item_id": str(uuid.uuid4()), "timestamp": datetime.utcnow(), "item": "item6", "quantity": 70, "price": 150, "category": "category2"},
#     {"item_id": str(uuid.uuid4()), "timestamp": datetime.utcnow(), "item": "item7", "quantity": 60, "price": 160, "category": "category2"},
#     {"item_id": str(uuid.uuid4()), "timestamp": datetime.utcnow(), "item": "item8", "quantity": 50, "price": 170, "category": "category3"},
#     {"item_id": str(uuid.uuid4()), "timestamp": datetime.utcnow(), "item": "item9", "quantity": 40, "price": 180, "category": "category3"},
#     {"item_id": str(uuid.uuid4()), "timestamp": datetime.utcnow(), "item": "item10", "quantity": 30, "price": 190, "category": "category3"},
# ]

inventory_collection.insert_many(inventory_data)

