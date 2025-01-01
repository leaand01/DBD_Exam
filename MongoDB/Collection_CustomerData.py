import uuid

from CreateDB import db

# Opret en collection for customers
customers_collection = db["customers"]

# Indsæt data/dokumenter
customers_data = [
    {"customer_id": str(uuid.uuid4()), "full_name": "someone1", "email": "someone1@example.com", "address": "address1"},
    {"customer_id": str(uuid.uuid4()), "full_name": "someone2", "email": "someone2@example.com", "address": "address2"},
    {"customer_id": str(uuid.uuid4()), "full_name": "someone3", "email": "someone3@example.com", "address": "address3"},
]
# customers_data = [
#     {"customer_id": str(uuid.uuid4()), "full_name": "someone1", "email": "someone1@example.com", "address": "address1"},
#     {"customer_id": str(uuid.uuid4()), "full_name": "someone2", "email": "someone2@example.com", "address": "address2"},
#     {"customer_id": str(uuid.uuid4()), "full_name": "someone3", "email": "someone3@example.com", "address": "address3"},
#     {"customer_id": str(uuid.uuid4()), "full_name": "someone4", "email": "someone4@example.com", "address": "address4"},
#     {"customer_id": str(uuid.uuid4()), "full_name": "someone5", "email": "someone5@example.com", "address": "address5"},
# ]

# Indsæt data i collection
customers_collection.insert_many(customers_data)


# Migration efter 1år
customers_data2 = [
    {"customer_id": str(uuid.uuid4()), "full_name": "someone4", "email": "someone4@example.com", "address": "address4", "mobile": 1234, "birthday": "ddmmyyyy"}, # Credit card info should be stored separate and encrypted. Not implemented
    {"customer_id": str(uuid.uuid4()), "full_name": "someone5", "email": "someone5@example.com", "address": "address5", "mobile": 1234, "birthday": "ddmmyyyy"},
]
# customers_data2 = [
#     {"customer_id": str(uuid.uuid4()), "full_name": "someone6", "email": "someone6@example.com", "address": "address6", "mobile": 1234, "birthday": "ddmmyyyy"}, # Credit card info should be stored separate and encrypted. Not implemented
#     {"customer_id": str(uuid.uuid4()), "full_name": "someone7", "email": "someone7@example.com", "address": "address7", "mobile": 1234, "birthday": "ddmmyyyy"},
# ]

# Indsæt data i collection
customers_collection.insert_many(customers_data2)

