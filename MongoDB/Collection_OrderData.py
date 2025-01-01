import uuid
from datetime import datetime
from CreateDB import db


# Opret en collection for inventory
orders_collection = db["orders"]

# load
customers = db["customers"].find()
inventory = db["inventory"].find()

customers = list(customers)
inventory = list(inventory)


# Indsæt nogle dokumenter
orders_data = [
    # order1
    {"order_id": str(uuid.uuid4()),
     # Embed customer info
     "customer": {
         "customer_id": customers[0]["customer_id"],
         "full_name": customers[0]["full_name"],
         "email": customers[0]["email"],
         "address": customers[0]["address"]
         },
     # Embed relevant inventory info
     "items": [
         {"item_id": inventory[0]["item_id"], "item": inventory[0]["item"], "price": inventory[0]["price"], "category": inventory[0]["category"], "amount": 1},
         {"item_id": inventory[1]["item_id"], "item": inventory[1]["item"], "price": inventory[1]["price"], "category": inventory[1]["category"], "amount": 2}
         ],
     "total_price": 320,
     "timestamp": datetime.utcnow()
     },

    # order2
    {"order_id": str(uuid.uuid4()),
     # Embed customer info
     "customer": {
         "customer_id": customers[1]["customer_id"],
         "full_name": customers[1]["full_name"],
         "email": customers[1]["email"],
         "address": customers[1]["address"]
         },
     # Embed relevant inventory info
     "items": [
         {"item_id": inventory[2]["item_id"], "item": inventory[2]["item"], "price": inventory[2]["price"], "category": inventory[2]["category"], "amount": 1},
         {"item_id": inventory[3]["item_id"], "item": inventory[3]["item"], "price": inventory[3]["price"], "category": inventory[3]["category"], "amount": 1}
         ],
     "total_price": 370,
     "timestamp": datetime.utcnow()
    }
    # {"order_id": str(uuid.uuid4()),
    #  # Embed customer info
    #  "customer": {
    #      "customer_id": customers[1]["customer_id"],
    #      "full_name": customers[1]["full_name"],
    #      "email": customers[1]["email"],
    #      "address": customers[1]["address"]
    #      },
    #  # Embed relevant inventory info
    #  "items": [
    #      {"item_id": inventory[8]["item_id"], "item": inventory[8]["item"], "price": inventory[8]["price"], "category": inventory[8]["category"], "amount": 1},
    #      {"item_id": inventory[9]["item_id"], "item": inventory[9]["item"], "price": inventory[9]["price"], "category": inventory[9]["category"], "amount": 1}
    #      ],
    #  "total_price": 370,
    #  "timestamp": datetime.utcnow()
    # }
]


orders_collection.insert_many(orders_data)

# opret index for hurtigt customer lookup
orders_collection.create_index('customer.email')


# Migration efter 1år
order_data2 = {"order_id": str(uuid.uuid4()),
                # Embed customer info
                "customer": {
                    "customer_id": customers[0]["customer_id"],
                    "full_name": customers[0]["full_name"],
                    "email": customers[0]["email"],
                    "address": customers[0]["address"]
                    },
                # Embed relevant inventory info
                "items": [
                    {"item_id": inventory[0]["item_id"], "item": inventory[0]["item"], "price": inventory[0]["price"], "category": inventory[0]["category"], "amount": 1},
                    {"item_id": inventory[1]["item_id"], "item": inventory[1]["item"], "price": inventory[1]["price"], "category": inventory[1]["category"], "amount": 2}
                    ],
                "discount_code": "black_friday50",
                "total_price": 160,
                "timestamp": datetime.utcnow()
                }

orders_collection.insert_one(order_data2)
